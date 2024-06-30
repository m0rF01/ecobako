import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/user/user_repository.dart';
import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
import 'package:ecobako_app/features/personalization/screens/profile/profile.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/helpers/network_manager.dart';
import 'package:ecobako_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateUserNameController extends GetxController{

  static UpdateUserNameController get instance => Get.find();

  final userName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user data when home screen appear
  @override
  void onInit(){
    initializedName();
    super.onInit();
  }

  // fetch user record
  Future<void> initializedName() async {
    userName.text = userController.user.value.username;
  }

  Future<void> updateUserName2() async {
    try {
      // Start the loading animation
      BakoFullScreenLoader.openLoadingDialog("Updating your information", BakoImages.docerAnimation);

      // Check Internet Commection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        BakoFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!updateUserNameFormKey.currentState!.validate()){
        BakoFullScreenLoader.stopLoading();
        return;
      }

      //Update user's first name and last name is the firebase firestore
      Map<String, dynamic> name = {"Username": userName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the RX user value
      userController.user.value.username = userName.text.trim();

      // Remove loader
      BakoFullScreenLoader.stopLoading();

      // Show Succcess message
      BakoLoaders.successSnackBar(title: "Success", message: "Your name has been updated.");

      // Move to previous screen
      Get.off(() => const ProfileScreen());

    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Sanp", message: e.toString());
      
    }
  }
}