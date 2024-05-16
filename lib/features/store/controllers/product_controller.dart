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


class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final imagePath = "".obs;
  final imageUploading = false.obs;
  final productRepository = Get.put(ProductRepository());
  final productID = TextEditingController();
  final productName = TextEditingController();
  final productDesc = TextEditingController();
  final productPoint = TextEditingController();
  final productQuantity = TextEditingController();
  GlobalKey<FormState> addProductFormKey = GlobalKey<FormState>();
  RxList<ProductModel> storeProducts = <ProductModel>[].obs;
  bool productDataFetched = false;

  @override
  void onInit() {
    fetchStoreProducts();
    super.onInit();
  }

  @override
  void onClose() {
    productID.dispose();
    productName.dispose();
    productDesc.dispose();
    productPoint.dispose();
    productQuantity.dispose();
    super.onClose();
  }

  Future<void> fetchStoreProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepository.getAllProducts();
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
      BakoFullScreenLoader.openLoadingDialog(
          "We are processing your request", BakoImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      if (!addProductFormKey.currentState!.validate()) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

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

      final bool isUnique =
          await productRepository.isIdUnique(productID.text.trim());
      if (!isUnique) {
        BakoFullScreenLoader.stopLoading();
        BakoLoaders.errorSnackBar(
          title: "Error",
          message:
              "The Id has been used on other products, please try again with another id",
        );
        return;
      }

      await productRepository.saveProductRecord(newProduct);

      BakoFullScreenLoader.stopLoading();

      BakoLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your product has been successfully added to the store.");

      clearFormData();
    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  void updateProduct(ProductModel oldProduct) async {
    try {
      // Start loading animations
      BakoFullScreenLoader.openLoadingDialog(
          "We are processing your request", BakoImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      // Check all form is fill in
      if (!addProductFormKey.currentState!.validate()) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      // Check if new image is pick
      if (imagePath.value.isNotEmpty) {
        oldProduct.productImage = await uploadImageToStorage(imagePath.value);
      }

      // Update the new data to database
      final updatedProduct = ProductModel(
        id: productID.text.trim(),
        productName: productName.text.trim(),
        productImage: oldProduct.productImage,
        point: int.tryParse(productPoint.text) ?? 0,
        productDescription: productDesc.text.trim(),
        stock: int.tryParse(productQuantity.text) ?? 0,
        productQR: oldProduct.productQR,
      );

      // command to push changes to database
      await productRepository.updateProductRecord(updatedProduct);

      BakoFullScreenLoader.stopLoading();

      BakoLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your product has been successfully updated.");
    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  Future<String> uploadImageToStorage(String imagePath) async {
    try {
      imageUploading.value = true;
      final reference = FirebaseStorage.instance
          .ref()
          .child("ProductImages")
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      final uploadTask = reference.putFile(File(imagePath));
      final snapshot = await uploadTask.whenComplete(() {});

      imageUploading.value = false;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      imageUploading.value = false;
      BakoLoaders.errorSnackBar(
          title: "Oh Snap", message: "Failed to upload image: $e");
      throw Exception("Image upload failed");
    }
  }

  void updateProductID(String newID) {
    productID.text = newID;
  }

  void updateProductName(String newName) {
    productName.text = newName;
  }

  void updateProductDesc(String newDesc) {
    productDesc.text = newDesc;
  }

  void updateProductPoint(String newPoint) {
    productPoint.text = newPoint;
  }

  void updateProductQuantity(String newQuantity) {
    productQuantity.text = newQuantity;
  }

  void saveFormDetails() {
    // Save or process the form details if needed
  }

  void clearFormData() {
    productID.clear();
    productName.clear();
    productDesc.clear();
    productPoint.clear();
    productQuantity.clear();
    imagePath.value = "";
  }
}