import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AdminLoginForm extends StatelessWidget {
  const AdminLoginForm({
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
                labelText: BakoTexts.adminID,
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
            const SizedBox(height: BakoSizes.spaceBtwSections),
        
            // Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){}, 
                child: const Text(BakoTexts.signIn)
              )
            ),
            const SizedBox(height: BakoSizes.spaceBtwItems,),
          ],
        ),
      ),
    );
  }
}