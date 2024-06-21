import 'package:ecobako_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_user/login.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BakoSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(BakoImages.deliveredEmailIllustration),
                width: BakoHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: BakoSizes.spaceBtwSections),

              // Title & Subtitle
              Text(email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              Text(BakoTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              Text(BakoTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BakoColors.buttonPrimary,
                    side: const BorderSide(
                      color: BakoColors.buttonPrimary,
                    ),
                  ),
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(BakoTexts.done),
                ),
              ),
              const SizedBox(
                height: BakoSizes.spaceBtwItems,
              ),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                  child: const Text(BakoTexts.resendEmail),
                ),
              ),
              const SizedBox(
                height: BakoSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
