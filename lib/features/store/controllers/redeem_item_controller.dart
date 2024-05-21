import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/product/product_repository.dart';
import 'package:ecobako_app/features/store/screens/user/product_details/user_product_redeem_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RedeemItemController extends GetxController {
  static RedeemItemController get instance => Get.find();
  
  GlobalKey<FormState> redeemItemFormKey = GlobalKey<FormState>();
  final productIdController = TextEditingController();
  final quantityController = TextEditingController();
  final productRepository = ProductRepository();
  // final FirebaseService _firebaseService = FirebaseService();

  final productId = ''.obs;
  final quantity = 1.obs;
  

  void scanQRCode() async {
    // QR code scanning logic here
  }

  void validateAndProceed() async {
  if (redeemItemFormKey.currentState?.validate() ?? false) {
    print("First stage checking...");
    final validationResult = await validateRedemption();
    if (validationResult['isValid']) {
      redeemItemFormKey.currentState?.save();
      print("This is what it passed for product ID: ${validationResult["productId"]}");
      print("This is what is passed for product quantity: ${validationResult["quantity"]}");
      // Proceed only if the validation is successful
      // Retrieve validation result values
      
      // Navigate to the summary page with the retrieved values
    
      Get.to(() => SummaryPage(
        productId: validationResult["productId"],
        quantity: validationResult["quantity"],
        totalCost: validationResult["totalCost"],
        userEcoPointBalance: validationResult["userEcoPointBalance"],
        productName: validationResult["productName"],
        productPrice: validationResult["productPrice"],
      ));
    } else {
     final errorMessage = validationResult['errorMessage'] ?? 'Unknown error occurred';
      showErrorMessage(errorMessage);
    }
  }
}

Future<Map<String, dynamic>> validateRedemption() async {
  // Get product ID and quantity from text controllers
  final String productId = productIdController.text;
  print("get data from product id controller $productId");
  final int quantity = int.tryParse(quantityController.text) ?? 0;
   print("get data from product quantity controller  $quantity");

  // Get product data from Firebase using the retrieved product ID
  final productData = await productRepository.getProductData(productId);
  print("Entering firebase to get product data from Firebase");
  if (productData.isEmpty) {
    return {'isValid': false, 'errorMessage': 'Product not found'};
  }

  final productStock = productData['Stock'] as int;
  print("Product stock from firebase: $productStock");
  final productPrice = productData['EcoPoint'] as int;
  print("Product point from firebase: $productPrice");
  final productName = productData['productName'] as String;
  print("Product point from firebase: $productName");

  final userEcoPointBalanceString = await productRepository.getUserEcoPointBalance();
  print("Getting the user ecopoint details process");
  final userEcoPointBalance = int.tryParse(userEcoPointBalanceString) ?? 0;
  final totalCost = productPrice * quantity;
  print("data for user ecopoint balance: $userEcoPointBalance");
  print("Data for total cost need: $totalCost");

  if (quantity > productStock) {
    print("Checking quantity vs product stock");
    return {'isValid': false, 'errorMessage': 'Insufficient stock'};
  }

  if (totalCost > userEcoPointBalance) {
    print("Checking total cost vs user ecopoint");
    return {'isValid': false, 'errorMessage': 'Insufficient EcoPoints balance to redeem the product'};
  }

  // Return validation result with validated values
  print("Returning validation result");
  return {'isValid': true, 'productId': productId, 'quantity': quantity, 'totalCost': totalCost, 'userEcoPointBalance' : userEcoPointBalance,  'productName':productName, 'productPrice': productPrice};
}

void showErrorMessage(String errorMessage) {
  // Show error message to the user (e.g., using a snackbar)
  BakoLoaders.errorSnackBar(title: "Error", message: errorMessage);
}

}
