// use and checked
import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecobako_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/helpers/network_manager.dart';
import 'package:ecobako_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
            // Loading animation
      BakoFullScreenLoader.openLoadingDialog(
          "Processing your request", BakoImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()){
        BakoFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove loader
      BakoFullScreenLoader.stopLoading();

      // Show Success Screen
      BakoLoaders.successSnackBar(title: "Email sent", message: "Email Link Sent to Reset Password");

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      try {
            // Loading animation
      BakoFullScreenLoader.openLoadingDialog(
          "Processing your request", BakoImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove loader
      BakoFullScreenLoader.stopLoading();

      // Show Success Screen
      BakoLoaders.successSnackBar(title: "Email sent", message: "Email Link Sent to Reset Password".tr);

    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Snap", message:e.toString());
    }
  }
}
