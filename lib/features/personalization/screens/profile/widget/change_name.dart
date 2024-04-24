import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/features/personalization/controllers/update_name_controller.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: BakoAppBar(
        showBackArrow: true,
        title: Text("Change Name", style: Theme.of(context).textTheme.headlineSmall,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(BakoSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Use real neme for easy verification process.",
            style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(
              height: BakoSizes.spaceBtwSections,
            ),

            Form(key: controller.updateUserNameFormKey,
             child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) => BakoValidator.validateEmptyText("First name", value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: BakoTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
                const SizedBox(height: BakoSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.lastName,
                  validator: (value) => BakoValidator.validateEmptyText("Last name", value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: BakoTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                )
              ],
             )),
             const SizedBox(height: BakoSizes.spaceBtwSections),

             SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text("Save")),
             )
          ],
        ) ,
        ),
    );
  }
}