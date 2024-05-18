import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecobako_app/data/repositories/user/user_repository.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_user/login.dart';
import 'package:ecobako_app/features/authentication/screens/qrcode/user/user_qr.dart';
import 'package:ecobako_app/features/personalization/models/user_model.dart';
import 'package:ecobako_app/features/personalization/screens/profile/widget/re_authenticate_user_login.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/network_manager.dart';
import 'package:ecobako_app/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  //static UserController get instance => Get.find<UserController>();
  static UserController get instance => Get.put(UserController());

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  bool dataFetched = false;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // fetch user record
  // Future<void> fetchUserRecord() async {
  //   try {
  //     profileLoading.value = true;
  //     final user = await userRepository.fetchUserDetails();
  //     this.user(user);
  //   } catch (e) {
  //     user(UserModel.empty());
  //   } finally {
  //     profileLoading.value = false;
  //   }
  // }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      if (!dataFetched) {
        final user = await userRepository.fetchUserDetails();
        this.user(user);
        dataFetched = true;
      }
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  void resetDataFetched() {
    dataFetched = false;
  }

// Save user record from any registation provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();
      if (userCredentials != null) {
        // Converts name to first name and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? "");
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? "");

        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join("") : "",
          username: username,
          homeAddress: "",
          gender: "",
          age: "",
          email: userCredentials.user!.email ?? "",
          phoneNo: userCredentials.user!.phoneNumber ?? "",
          profilePicture: userCredentials.user!.photoURL ?? "",
          ecoPoint: "0",
          role: "user", 
          userQR: "",
        );

        // save user data
        await userRepository.saveUserRecord(user);
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
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Re verify Auth Email
        if (provider == "google.com") {
          await auth.signInWithGoogle();
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

      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      BakoFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
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
            await userRepository.uploadImage("Users/Images/Profile/", image);

        //Update user image Record
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        BakoLoaders.successSnackBar(
            title: "Congratulations",
            message: "Your profile picture has been updated successfully!");
      }
    } catch (e) {
      BakoLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Something went wrong!: $e");
    } finally {
      imageUploading.value = false;
    }
  }

// get user qr image and redirect to userQrCode page
Future<String> generateAndSaveQRCode(String userId) async {
    try {
      final downloadUrl = await userRepository.generateAndSaveQRCode(userId);
      user.update((val) {
        val?.userQR = downloadUrl; 
      });

      Get.to(() => const UserQrCode());

      return downloadUrl;
      
    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      rethrow;
    }
  }

}
