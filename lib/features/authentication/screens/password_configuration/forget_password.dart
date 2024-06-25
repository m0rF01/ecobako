// use and checked
import 'package:ecobako_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(BakoSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              BakoTexts.forgetPassword, 
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: BakoSizes.spaceBtwItems),

            Text(
              BakoTexts.forgetPasswordSubTitle, 
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: BakoSizes.spaceBtwSections * 2),

            //Text Fields
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField (
                controller: controller.email,
                validator: BakoValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: BakoTexts.email, 
                  prefixIcon: Icon(Iconsax.direct_right)
                ),
              ),
            ),
            const SizedBox(height: BakoSizes.spaceBtwSections),

            //Submit Button
            SizedBox(
              width: double.infinity, 
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: BakoColors.buttonPrimary,
                    side: const BorderSide(
                      color: BakoColors.buttonPrimary,
                    ),
                  ),
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(BakoTexts.submit),
              ),
            )
          ],
        ),
      ),
    );
  }
}