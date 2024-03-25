import 'package:ecobako_app/common/widget/success_screen/success_screen.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_user/login.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()), 
            icon: const Icon(CupertinoIcons.clear)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BakoSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(image: const AssetImage(
                BakoImages.deliveredEmailIllustration), 
                width: BakoHelperFunctions.screenWidth()*0.6,
              ),
              const SizedBox(height: BakoSizes.spaceBtwSections),

              // Title & Subtitle
              Text(
                BakoTexts.confirmEmail, 
                style: Theme.of(context).textTheme.headlineMedium, 
                textAlign: TextAlign.center
              ),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              Text(
                "fyptesting@gmail.com", 
                style: Theme.of(context).textTheme.labelLarge, 
                textAlign: TextAlign.center
              ),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              Text(
                BakoTexts.confirmEmailSubTitle, 
                style: Theme.of(context).textTheme.labelMedium, 
                textAlign: TextAlign.center
              ),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              // Buttons
              SizedBox(
                width: double.infinity, 
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessScreen(
                    image: BakoImages.staticSuccessIllustration,
                    title: BakoTexts.yourAccountCreatedTitle,
                    subTitle: BakoTexts.yourAccountCreatedSubTitle,
                    onPressed: () => Get.to(() => const LoginScreen()),
                    )), 
                  child: const Text(BakoTexts.tContinue),
                ),
              ),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              SizedBox(
                width: double.infinity, 
                child: TextButton(
                  onPressed: (){}, 
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