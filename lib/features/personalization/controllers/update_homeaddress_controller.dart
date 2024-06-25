// use anc checked
import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/user/user_repository.dart';
import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
import 'package:ecobako_app/features/personalization/screens/profile/profile.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/helpers/network_manager.dart';
import 'package:ecobako_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateHomeAddressController extends GetxController{

  static UpdateHomeAddressController get instance => Get.find();

  final homeAddress = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateHomeAddressFormKey = GlobalKey<FormState>();

  // init user data when home screen appear
  @override
  void onInit(){
    initializedName();
    super.onInit();
  }

  // fetch user record
  Future<void> initializedName() async {
    homeAddress.text = userController.user.value.homeAddress;
  }

  Future<void> updateHomeAddress() async {
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
      if(!updateHomeAddressFormKey.currentState!.validate()){
        BakoFullScreenLoader.stopLoading();
        return;
      }

      //Update user's first name and last name is the firebase firestore
      Map<String, dynamic> name = {"Address": homeAddress.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the RX user value
      userController.user.value.homeAddress = homeAddress.text.trim();

      // Remove loader
      BakoFullScreenLoader.stopLoading();

      // Show Succcess message
      BakoLoaders.successSnackBar(title: "Congratulation", message: "Your name has been updated.");

      // Move to previous screen
      Get.off(() => const ProfileScreen());

    } catch (e) {
      BakoFullScreenLoader.stopLoading();
      BakoLoaders.errorSnackBar(title: "Oh Sanp", message: e.toString());
      
    }
  }
}