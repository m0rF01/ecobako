import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/authentication/admin_auth_repo.dart';
import 'package:ecobako_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/helpers/network_manager.dart';
import 'package:ecobako_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  // variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> userLoginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

// Email and Password Signin
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      BakoFullScreenLoader.openLoadingDialog(
          "Logging you in....", BakoImages.docerAnimation);

      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      // if (!userLoginFormKey.currentState!.validate()) {
      //   BakoFullScreenLoader.stopLoading();
      //   return;
      // }
      if (userLoginFormKey.currentState?.validate() ?? false) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      //Save login cridential if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // Login user using Email & Password Auth
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // // Check user role after successful login
      final role = await AuthenticationRepository.instance
          .getUserRole(userCredentials.user?.uid ?? "");

      // Handle redirection based on role
      redirectToHomePage(role);
    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

// Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // start loading animation
      BakoFullScreenLoader.openLoadingDialog(
          "Logging you in...", BakoImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      // Google authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();
    } catch (e) {
      BakoLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  // Email and Password Signin
  Future<void> adminEmailAndPasswordSignIn() async {
    try {
      // Start loading
      BakoFullScreenLoader.openLoadingDialog(
          "Logging you in....", BakoImages.docerAnimation);

      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      // if (!userLoginFormKey.currentState!.validate()) {
      //   BakoFullScreenLoader.stopLoading();
      //   return;
      // }
      if (userLoginFormKey.currentState?.validate() ?? false) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      // Login user using Email & Password Auth
      final adminCredentials = await AdminAuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

         // // Check user role after successful login
      final role = await AdminAuthenticationRepository.instance
          .getAdminRole(adminCredentials.user?.uid ?? "");
      
      redirectToHomePage(role);
    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  // Chechk role for admin and user then redirect to dedicated home page
    void redirectToHomePage(String? role) async {
    if (role == "user") {
      BakoFullScreenLoader.stopLoading();
      await AuthenticationRepository.instance.screenRedirect();
    } else if (role == "admin"){
      BakoFullScreenLoader.stopLoading();
      await AdminAuthenticationRepository.instance.screenRedirect();
    } 
    else {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(
          title: "Invalid role", 
          message: "This account/credential does not have access to this account.");
      return;
    }
  }

}
