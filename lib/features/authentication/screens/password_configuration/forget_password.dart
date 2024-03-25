import 'package:ecobako_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
            TextFormField (
              decoration: const InputDecoration(
                labelText: BakoTexts.email, 
                prefixIcon: Icon(Iconsax.direct_right)
              ),
            ),
            const SizedBox(height: BakoSizes.spaceBtwSections),

            //Submit Button
            SizedBox(
              width: double.infinity, 
              child: ElevatedButton(
                onPressed: () => Get.off(() => const ResetPassword()),
                child: const Text(BakoTexts.submit),
              ),
            )
          ],
        ),
      ),
    );
  }
}