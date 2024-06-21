import 'package:ecobako_app/features/authentication/controllers/login/login_controller.dart';
import 'package:ecobako_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecobako_app/features/authentication/screens/signup/user_signup/signup.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BakoLoginForm extends StatelessWidget {
  const BakoLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.userLoginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: BakoSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => BakoValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: BakoTexts.email,
              ),
            ),
            const SizedBox(height: BakoSizes.spaceBtwInputFields),

            //Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => BakoValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: BakoTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(height: BakoSizes.spaceBtwInputFields / 2),

            //Remember and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value)),
                    const Text(BakoTexts.rememberMe),
                  ],
                ),

                //forget password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(BakoTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: BakoSizes.spaceBtwSections),

            // Sign in Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: BakoColors.buttonPrimary,
                        side:
                            const BorderSide(color: BakoColors.buttonPrimary)),
                    child: const Text(BakoTexts.signIn))),
            const SizedBox(
              height: BakoSizes.spaceBtwItems,
            ),

            // Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    style: OutlinedButton.styleFrom(
                        side:
                            const BorderSide(color: BakoColors.buttonPrimary)),
                    child: const Text(BakoTexts.createAccount))),
            const SizedBox(height: BakoSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
