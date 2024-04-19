import 'dart:async';
import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/common/widget/success_screen/success_screen.dart';
import 'package:ecobako_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAuthRedirect();
    super.onInit();
  }

// Send email verfication link to user
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      BakoLoaders.successSnackBar(title: "Email Sent", message: "Please Check your inbox and verify your email");

    }catch (e) {
      BakoLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  // Timer to auto redirect on email verification
  setTimerForAuthRedirect(){
    Timer.periodic(
      const Duration (seconds: 1), 
      (timer) async { 
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: BakoImages.sccessfullyRegisterAnimation, 
              title: BakoTexts.yourAccountCreatedTitle, 
              subTitle: BakoTexts.yourAccountCreatedSubTitle, 
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      }
    );
  }

  // normally check if email verified
  checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: BakoImages.sccessfullyRegisterAnimation,
          title: BakoTexts.yourAccountCreatedTitle, 
          subTitle: BakoTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()
          ),
        );
    }
  }
}