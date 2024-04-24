import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthUserLoginForm extends StatelessWidget {
  const ReAuthUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text("Re-Authenticate User")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BakoSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: BakoValidator.validateEmail,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: BakoTexts.email,
                    ),
                  ),
                  const SizedBox(
                    height: BakoSizes.spaceBtwInputFields,
                  ),

                  Obx(() => TextFormField(
                        obscureText: controller.hidePassword.value,
                        controller: controller.verifyPassword,
                        validator: (value) =>
                            BakoValidator.validateEmptyText("Password", value),
                        decoration: InputDecoration(
                            labelText: BakoTexts.password,
                            prefixIcon: const Icon(Iconsax.password_check),
                            suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                              icon: const Icon(Iconsax.eye_slash),
                            )),
                      )),
                  const SizedBox(
                    height: BakoSizes.spaceBtwSections,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmaiAndPassword(),
                        child: const Text("Verify")),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
