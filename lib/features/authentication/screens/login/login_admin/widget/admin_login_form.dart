// use and checked
import 'package:ecobako_app/features/authentication/controllers/login/admin_login/admin_login_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminLoginForm extends StatelessWidget {
  const AdminLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminLoginController());
    return Form(
      key: controller.adminLoginFormKey,
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
                labelText: BakoTexts.adminEmail,
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
            const SizedBox(height: BakoSizes.spaceBtwSections),

            // Sign in Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.adminEmailAndPasswordSignIn(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: BakoColors.buttonPrimary,
                        side:
                            const BorderSide(color: BakoColors.buttonPrimary)),
                    child: const Text(BakoTexts.signIn))),
            const SizedBox(
              height: BakoSizes.spaceBtwItems,
            ),


// Open only, want to add new admin 
            // SizedBox(
            //     width: double.infinity,
            //     child: OutlinedButton(
            //         onPressed: () => Get.to(() => const AdminSignupScreen()),
            //         style: OutlinedButton.styleFrom(
            //             side:
            //                 const BorderSide(color: BakoColors.buttonPrimary)),
            //         child: const Text(BakoTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
