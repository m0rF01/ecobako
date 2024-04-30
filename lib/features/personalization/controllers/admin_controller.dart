import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/admin/admin_repository.dart';
import 'package:ecobako_app/data/repositories/authentication/admin_auth_repo.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_admin/admin_login.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_user/login.dart';
import 'package:ecobako_app/features/personalization/models/admin_modal.dart';
import 'package:ecobako_app/features/personalization/screens/profile/widget/re_authenticate_user_login.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/network_manager.dart';
import 'package:ecobako_app/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminController extends GetxController {
  //static UserController get instance => Get.find<UserController>();
  static AdminController get instance => Get.put(AdminController());

  final profileLoading = false.obs;
  Rx<AdminModel> user = AdminModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final adminRepository = Get.put(AdminRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchAdminRecord();
  }

  // fetch admin record
  Future<void> fetchAdminRecord() async {
    try {
      profileLoading.value = true;
      final user = await adminRepository.fetchAdminDetails();
      this.user(user);
    } catch (e) {
      user(AdminModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

// Save user record from any registation provider
  Future<void> saveAdminRecord(UserCredential? userCredentials) async {
    try {
      await fetchAdminRecord();
      if (userCredentials != null) {
        // Converts name to first name and last name
        // final username =
        //     AdminModel.generateUsername(userCredentials.user!.displayName ?? "");

        // Map Data
        final admin = AdminModel(
          id: userCredentials.user!.uid,
          username: "",
          email: userCredentials.user!.email ?? "",
          profilePicture: userCredentials.user!.photoURL ?? "",
          role: "admin",
        );

        // save user data
        await adminRepository.saveAdminRecord(admin);
      }
    } catch (e) {
      BakoLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              "Something went wrong while saving your information. Ypu can resave your data in your Profile.");
    }
  }

// Delete acc warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(BakoSizes.md),
        title: "Delete Account",
        middleText: "Are you sure you want to delete the account?",
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: BakoSizes.lg),
              child: Text("Delete"),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text("Cancel")));
  }

  void deleteUserAccount() async {
    try {
      BakoFullScreenLoader.openLoadingDialog(
          "Processing", BakoImages.docerAnimation);

      //First re-auth user
      final auth = AdminAuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Re verify Auth Email
        if (provider == "google.com") {
          await auth.deleteAccount();
          BakoFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          BakoFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthUserLoginForm());
        }
      }
    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.warningSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  Future<void> reAuthenticateEmaiAndPassword() async {
    try {
      BakoFullScreenLoader.openLoadingDialog(
          "Processing", BakoImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      await AdminAuthenticationRepository.instance.reAuthenticateEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AdminAuthenticationRepository.instance.deleteAccount();
      BakoFullScreenLoader.stopLoading();
      Get.offAll(() => const AdminLoginScreen());
    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.warningSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await adminRepository.uploadImage("Users/Images/Profile/", image);

        //Update user image Record
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await adminRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        BakoLoaders.successSnackBar(
            title: "Congratulations",
            message: "Your profile picture has been updated successfully!");
      }
    } catch (e) {
      BakoLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Something went wrong!: $e");
    } finally{
      imageUploading.value = false;
    }
  }
}
