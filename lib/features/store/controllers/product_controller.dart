import 'dart:io';

import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/product/product_repository.dart';
import 'package:ecobako_app/features/store/models/product_model.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/helpers/network_manager.dart';
import 'package:ecobako_app/utils/popups/full_screen_loader.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final imagePath = "".obs;
  final imageUploading = false.obs;
  final productRepository = Get.put(ProductRepository());
  final productID = TextEditingController(); // controller for first name input
  final productName = TextEditingController(); // controller for lastname input
  final productDesc = TextEditingController(); // controller for username input
  final productPoint = TextEditingController(); // controller for address input
  final productQuantity = TextEditingController(); // controller for age input
  GlobalKey<FormState> addProductFormKey = GlobalKey<FormState>();
  RxList<ProductModel> storeProducts = <ProductModel>[].obs;
  bool productDataFetched = false;

  @override
  void onInit() {
    fetchStoreProducts();
    super.onInit();
  }


  Future<void> fetchStoreProducts() async {
    try {
      // show loader UI while waiting for the product to be fetched
      isLoading.value = true;
      // fetch the product
      final products = await productRepository.getAllProducts();
      // Assign the product
      storeProducts.assignAll(products);
    } catch (e) {
      BakoLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void resetProductDataFetched() {
    productDataFetched = false;
  }

  Future<String?> selectProductImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedFile?.path;
  }

  void setImagePath(String path) {
    imagePath.value = path;
  }

  void addNewProduct() async {
    try {
      // Loading animation
      BakoFullScreenLoader.openLoadingDialog(
          "We are processing your request", BakoImages.docerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!addProductFormKey.currentState!.validate()) {
        // Remove loader
        BakoFullScreenLoader.stopLoading();
        return;
      }


      // Upload product image
      if (imagePath.value.isEmpty) {
        BakoLoaders.errorSnackBar(
          title: "Error",
          message: "Please select a product image.",
        );
        BakoFullScreenLoader.stopLoading();
        return;
      }

      final imageUrl = await uploadImageToStorage(imagePath.value);

      final newProduct = ProductModel(
        id: productID.text.trim(),
        productName: productName.text.trim(),
        productImage: imageUrl,
        point: int.tryParse(productPoint.text) ?? 0,
        productDescription: productDesc.text.trim(),
        stock: int.tryParse(productQuantity.text) ?? 0,
        productQR: "",
      );

      // final productRepository = Get.put(ProductRepository());
      final bool isUnique = await productRepository.isIdUnique(productID.text.trim());
      if (!isUnique) {
        BakoFullScreenLoader.stopLoading();
        BakoLoaders.errorSnackBar(
          title: "Error",
          message: "The Id have been used on other products, please try again with other id",
        );// ID is not unique, show error message to admin
        // Handle error: ID is not unique
        return;
      }

      await productRepository.saveProductRecord(newProduct);

      BakoFullScreenLoader.stopLoading();

      // Show Success Message
      BakoLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your product has been successfully aadded to the store.");

      clearFormData();
    } catch (e) {
      // Remove loader
      BakoFullScreenLoader.stopLoading();
      // Show some generic error message to the user
      BakoLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  Future<String> uploadImageToStorage(String imagePath) async {
    try {
      final uuid = Uuid();
      final uniqueId = uuid.v1();
      final file = File(imagePath);
      final storageRef =
          FirebaseStorage.instance.ref().child('Products/images/$uniqueId');
      final uploadTask = storageRef.putFile(file);
      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception("Failed to upload image: $e");
    }
  }

  String generateQR(String productId) {
    // Implement QR code generation logic here
    return "generated_qr_code_for_$productId";
  }

  void clearFormData() {
    // Clear text editing controllers
    // Get.find<ProductController>().productID.clear();
    // Get.find<ProductController>().productName.clear();
    // Get.find<ProductController>().productDesc.clear();
    // Get.find<ProductController>().productPoint.clear();
    // Get.find<ProductController>().productQuantity.clear();
    // Get.find<ProductController>().imagePath.value = '';
    productID.clear();
    productName.clear();
    productDesc.clear();
    productPoint.clear();
    productQuantity.clear();
    imagePath.value = '';
  }
}
