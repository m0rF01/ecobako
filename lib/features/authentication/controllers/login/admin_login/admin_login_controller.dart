import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/authentication/admin_auth_repo.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/helpers/network_manager.dart';
import 'package:ecobako_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AdminLoginController extends GetxController {
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
      final adminCredentials = await AdminAuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // // Check user role after successful login
      final role = await AdminAuthenticationRepository.instance
          .getAdminRole(adminCredentials.user?.uid ?? "");

      final box = GetStorage();
      box.write('admin_logged_in', true);
      
      redirectToHomePage(role);
    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  // Chechk role for admin and user then redirect to dedicated home page
  void redirectToHomePage(String? role) async {
    if (role == "user"||role == null || role.isEmpty) {
      // Handle the case when the role is not found
      BakoFullScreenLoader.stopLoading();
      // Get.offAll(() => const ChooseRole());
      BakoLoaders.errorSnackBar(
          title: "Invalid role",
          message:
              "This account/credential does not have access to this account.");
      return;
    } else if (role == "admin") {
      BakoFullScreenLoader.stopLoading();
      await AdminAuthenticationRepository.instance.adminScreenRedirect();
    } else {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(
          title: "Invalid role",
          message:
              "This account/credential does not have access to this account.");
      return;
    }
  }
}
