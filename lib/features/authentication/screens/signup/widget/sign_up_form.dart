import 'package:ecobako_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecobako_app/features/authentication/screens/signup/widget/terms_conditions_checkbox.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BakoSignUpForm extends StatelessWidget {
  const BakoSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // First Name & last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: BakoTexts.firstName, 
                    prefixIcon: Icon(Iconsax.user)
                  ),
                ),
              ),
              const SizedBox(width: BakoSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: BakoTexts.lastName, 
                    prefixIcon: Icon(Iconsax.user)
                  ),
                ),
              ),
            ],
          ),
              const SizedBox(height: BakoSizes.spaceBtwInputFields),
    
              // Username
              TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: BakoTexts.username, 
                    prefixIcon: Icon(Iconsax.user_edit)
                  ),
              ),
              const SizedBox(height: BakoSizes.spaceBtwInputFields),

              // Address line 1
              TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: BakoTexts.homeAddress, 
                    prefixIcon: Icon(Iconsax.location)
                  ),
              ),
              const SizedBox(height: BakoSizes.spaceBtwInputFields),

               Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: BakoTexts.postal, 
                        prefixIcon: Icon(Iconsax.signpost)
                      ),
                    ),
                  ),
                  const SizedBox(width: BakoSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: BakoTexts.country, 
                        prefixIcon: Icon(Iconsax.global)
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: BakoSizes.spaceBtwInputFields),

               Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: BakoTexts.gender, 
                        prefixIcon: Icon(Iconsax.link)
                      ),
                    ),
                  ),
                  const SizedBox(width: BakoSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: BakoTexts.age, 
                        prefixIcon: Icon(Iconsax.calendar)
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: BakoSizes.spaceBtwInputFields),

              // // Age
              // TextFormField(
              //     expands: false,
              //     decoration: const InputDecoration(
              //       labelText: BakoTexts.age, 
              //       prefixIcon: Icon(Iconsax.calendar)
              //     ),
              // ),
              // const SizedBox(height: BakoSizes.spaceBtwInputFields),
    
              // Email
              TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: BakoTexts.email, 
                    prefixIcon: Icon(Iconsax.direct)
                  ),
              ),
              const SizedBox(height: BakoSizes.spaceBtwInputFields),
    
              // Phone Number
              TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: BakoTexts.phoneNo, 
                    prefixIcon: Icon(Iconsax.call)
                  ),
              ),
              const SizedBox(height: BakoSizes.spaceBtwInputFields),
    
              //Password
              TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: BakoTexts.password, 
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: Icon(Iconsax.eye_slash),
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
                  onPressed: () => Get.to(() => const VerifyEmailScreen()), 
                   style: ElevatedButton.styleFrom(
                backgroundColor: BakoColors.buttonPrimary),
                  child: const Text(BakoTexts.createAccount),
                ),
              ),
              const SizedBox(height: BakoSizes.spaceBtwSections),    
        ],
      )
      );
  }
}

