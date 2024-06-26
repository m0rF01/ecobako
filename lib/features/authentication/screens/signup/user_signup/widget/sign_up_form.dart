// use and checked
import 'package:ecobako_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecobako_app/features/authentication/screens/signup/user_signup/widget/terms_conditions_checkbox.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BakoSignUpForm extends StatelessWidget {
  const BakoSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            // First Name & last name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        BakoValidator.validateStringAlphabetic("First name", value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: BakoTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: BakoSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        BakoValidator.validateStringAlphabetic("Last name", value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: BakoTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: BakoSizes.spaceBtwInputFields),

            // Username
            TextFormField(
              validator: (value) =>
                  BakoValidator.validateAlphanumeric("Username", value),
              controller: controller.username,
              expands: false,
              decoration: const InputDecoration(
                  labelText: BakoTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: BakoSizes.spaceBtwInputFields),

            // Address line 1
            TextFormField(
              validator: (value) =>
                  BakoValidator.validateAddress("Home address", value),
              controller: controller.homeAddress,
              expands: false,
              decoration: const InputDecoration(
                  labelText: BakoTexts.homeAddress,
                  prefixIcon: Icon(Iconsax.location)),
            ),
            const SizedBox(height: BakoSizes.spaceBtwInputFields),
   
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.age,
                    validator: (value) =>
                        BakoValidator.validateAge("Age", value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: BakoTexts.age,
                        prefixIcon: Icon(Iconsax.calendar)),
                  ),
                ),
                const SizedBox(width: BakoSizes.spaceBtwInputFields),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: controller.gender.value,
                    validator: (value) => BakoValidator.validateGender("Gender", value),
                    onChanged: (String? newValue) {
                      controller.gender.value = newValue!;
                    },
                    items: <String>['Male', 'Female'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                        labelText: BakoTexts.gender,
                        prefixIcon: Icon(Iconsax.link)),
                  ),
                ),
              ],
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

            // Phone Number
            TextFormField(
              controller: controller.phoneNo,
              validator: (value) => BakoValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: BakoTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
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

            //Terms and Conditions Checkbox
            const BakoTermsAndConditionCheckbox(),

            const SizedBox(height: BakoSizes.spaceBtwSections),

            // Sign up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
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
