import 'package:ecobako_app/features/authentication/controllers/signup/admin_signup_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BakoAdminSignUpForm extends StatelessWidget {
  const BakoAdminSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminSignupController());
    return Form(
        key: controller.adminSignupFormKey,
        child: Column(
          children: [      // Username
            TextFormField(
              validator: (value) =>
                  BakoValidator.validateEmptyText("Username", value),
              controller: controller.username,
              expands: false,
              decoration: const InputDecoration(
                  labelText: BakoTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: BakoSizes.spaceBtwInputFields),
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => BakoValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: BakoTexts.email, prefixIcon: Icon(Iconsax.direct)),
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
            const SizedBox(height: BakoSizes.spaceBtwInputFields),

            const SizedBox(height: BakoSizes.spaceBtwSections),

            // Sign up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.adminSignup(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: BakoColors.buttonPrimary,
                    side: const BorderSide(color: BakoColors.buttonPrimary)),
                child: const Text(BakoTexts.createAccount),
              ),
            ),
            const SizedBox(height: BakoSizes.spaceBtwSections),
          ],
        ));
  }
}
