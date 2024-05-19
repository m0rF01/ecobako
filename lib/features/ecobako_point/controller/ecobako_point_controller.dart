import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/user/user_repository.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/helpers/network_manager.dart';
import 'package:ecobako_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPointController extends GetxController {
  static AdminPointController get instance => Get.find();

  final userID = TextEditingController();
  final petWeight = TextEditingController();
  final hdpeWeight = TextEditingController();
  final ppWeight = TextEditingController();
  GlobalKey<FormState> addPointFormKey = GlobalKey<FormState>();
  final userRepository = UserRepository();

  Future <void> addUserPoints() async {
    try {
      // Start loading
      BakoFullScreenLoader.openLoadingDialog(
          "We are processing your information...", BakoImages.docerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BakoFullScreenLoader.stopLoading();
        Get.snackbar("Error", "No internet connection.");
        return;
      }
      // Form validation
      if (!addPointFormKey.currentState!.validate()) {
        BakoFullScreenLoader.stopLoading();
        Get.snackbar("Error", "Form validation failed.");
        return;
      }

      // Retrieve values entered by admin
      String userid = userID.text;
      double petWeightValue;
      double hdpeWeightValue;
      double ppWeightValue;

      // Parse the weights, handle potential parsing errors
      try {
        petWeightValue = double.parse(petWeight.text);
      } catch (e) {
        BakoFullScreenLoader.stopLoading();
        Get.snackbar("Error", "Invalid PET Weight value.");
        return;
      }

      try {
        hdpeWeightValue = double.parse(hdpeWeight.text);
      } catch (e) {
        BakoFullScreenLoader.stopLoading();
        Get.snackbar("Error", "Invalid HDPE Weight value.");
        return;
      }

      try {
        ppWeightValue = double.parse(ppWeight.text);
      } catch (e) {
        BakoFullScreenLoader.stopLoading();
        Get.snackbar("Error", "Invalid PP Weight value.");
        return;
      }

      // Calculate points based on weights and material prices
      double petPoints = petWeightValue * MaterialPrices.petPrice;
      double hdpePoints = hdpeWeightValue * MaterialPrices.hdpePrice;
      double ppPoints = ppWeightValue * MaterialPrices.ppPrice;

      // Calculate total points earned
      double totalPoints = petPoints + hdpePoints + ppPoints;

      // Round down to the nearest integer
      int roundedTotalPoints = totalPoints.floor();

      // Fetch existing points
      final existingPoints =
          await userRepository.fetchUserEcoPoints(userid);

      // Adding new point with existing points
      final newTotalPoints = existingPoints + roundedTotalPoints;

      // Update user points with new total points
      await userRepository.updateUserEcoPoints(userid, newTotalPoints);


      // Stop loading and show success message
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.successSnackBar(
          title: "Success",
          message: "$roundedTotalPoints Point successfully added to the user account.");
    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Snappppp", message: e.toString());
    }
  }

   void clearFields() {
    userID.clear();
    petWeight.clear();
    hdpeWeight.clear();
    ppWeight.clear();
  }
}

class MaterialPrices {
  static const double petPrice = 1.0; // Price per kg for PET
  static const double hdpePrice = 0.8; // Price per kg for HDPE
  static const double ppPrice = 1.2; // Price per kg for PP
}

