import 'package:ecobako_app/data/repositories/authentication/admin_auth_repo.dart';
import 'package:ecobako_app/features/authentication/controllers/signup/admin_verify_email_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminVerifyEmailScreen extends StatelessWidget {
  const AdminVerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminVerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AdminAuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BakoSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage(BakoImages.deliveredEmailIllustration),
                width: BakoHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: BakoSizes.spaceBtwSections),

              // Title & Subtitle
              Text(BakoTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              Text(email ?? "",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              Text(BakoTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: BakoColors.buttonPrimary),
                  child: const Text(BakoTexts.tContinue),
                ),
              ),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(BakoTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
