import 'package:ecobako_app/features/authentication/screens/choose_role/choose_role.dart';
import 'package:ecobako_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();

  // called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  // Function to show relevent Screen 
  screenRedirect() async {
    // local storage

    if (kDebugMode) {
      print("==================GET STORAGE Auth Repo =================");
      print(deviceStorage.read("isFirstTime"));
    }

    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") != true ? Get.offAll(() => const ChooseRole()) : Get.offAll(() => const OnBoardingScreen());                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  }

  /*-------------------------------- Email & Password sign-in -------------------------------*/

  /// Email auth - sign in
   
  /// Email auth - registration
   
  /// reauth - reauth user
   
  /// emailVerification - email verification
  
  /// emailAuthentication - forgot password
   
  /*-------------------------------- Federated identity & social sign in -------------------------------*/

  // GoogleAuth - Google

  // FacebookAuth - Facebook

   /*-------------------------------- End Federated identity & social sign in -------------------------------*/

  // LogoutUser - Valid for any authentication.

  // DeleteUser - Remove user Auth and Firestore Account
}