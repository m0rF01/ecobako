// CAN BE DELETED



// import 'package:ecobako_app/common/widget/loaders/loaders.dart';
// import 'package:ecobako_app/data/repositories/admin/admin_repository.dart';
// import 'package:ecobako_app/data/repositories/authentication/admin_auth_repo.dart';
// import 'package:ecobako_app/features/authentication/screens/signup/admin_signup/admin_verify_email.dart';
// import 'package:ecobako_app/features/personalization/models/admin_modal.dart';
// import 'package:ecobako_app/utils/constants/image_strings.dart';
// import 'package:ecobako_app/utils/helpers/network_manager.dart';
// import 'package:ecobako_app/utils/popups/full_screen_loader.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AdminSignupController extends GetxController {
//   static AdminSignupController get instance => Get.find();

//   // variables
//   final hidePassword = true.obs; // Observable for hiding/showing password
//   final email = TextEditingController(); // controller for email input
//   final password = TextEditingController(); // controller for password input
//   final username = TextEditingController();
//   GlobalKey<FormState> adminSignupFormKey =
//       GlobalKey<FormState>(); // Form key for form validation

//   void adminSignup() async {
//     try {
//       // Start loading
//       BakoFullScreenLoader.openLoadingDialog(
//           "We are processing your information...", BakoImages.docerAnimation);

//       // Check Internet connectivity
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         BakoFullScreenLoader.stopLoading();
//         return;
//       }

//       // Form validation
//       if (!adminSignupFormKey.currentState!.validate()) {
//         // Remove loader
//         BakoFullScreenLoader.stopLoading();
//         return;
//       }

//       // Register user in the Firebase Aurhentication & Save user data in the Firebase
//       final userCredential = await AdminAuthenticationRepository.instance
//           .registerWithEmailAndPassword(
//               email.text.trim(), password.text.trim());

//       // Save Authenticated user data in the Firebase Firestore
//       final newAdmin = AdminModel(
//         id: userCredential.user!.uid,
//         email: email.text.trim(),
//         username: username.text.trim(),
//         profilePicture: "",
//         role: "admin",
//       );

//       final userRepository = Get.put(AdminRepository());
//       await userRepository.saveAdminRecord(newAdmin);

//       BakoFullScreenLoader.stopLoading();

//       // Show Success Message
//       BakoLoaders.successSnackBar(
//           title: "Congratulations",
//           message:
//               "Your account has been created successfully! Verify email to continue");

//       // Move to Verify Email Screen
//       Get.to(() => AdminVerifyEmailScreen(email: email.text.trim()));
//     } catch (e) {
//       // Remove loader
//       BakoFullScreenLoader.stopLoading();
//       // Show some generic error message to the user
//       BakoLoaders.errorSnackBar(title: "Oops!", message: e.toString());
//     }
//   }
// }
