import 'package:ecobako_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecobako_app/features/authentication/screens/signup/signup.dart';
import 'package:ecobako_app/user_navigation_menu.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BakoLoginForm extends StatelessWidget {
  const BakoLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: BakoSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right), 
                labelText: BakoTexts.email,
              ),
            ),
            const SizedBox(height: BakoSizes.spaceBtwInputFields),
        
            //Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check), 
                labelText: BakoTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: BakoSizes.spaceBtwInputFields/2),
        
            //Remember and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    const Text(BakoTexts.rememberMe),
                  ],
                ),
        
                //forget password
                TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(BakoTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: BakoSizes.spaceBtwSections),
        
            // Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const UserNavigationMenu()), 
                child: const Text(BakoTexts.signIn)
              )
            ),
            const SizedBox(height: BakoSizes.spaceBtwItems,),
        
            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()), 
                child: const Text(BakoTexts.createAccount)
              )
            ),
            const SizedBox(height: BakoSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}