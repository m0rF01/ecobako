import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/features/personalization/controllers/update_username_controller.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeUserName extends StatelessWidget {
  const ChangeUserName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUserNameController());
    return Scaffold(
      appBar: BakoAppBar(
        showBackArrow: true,
        title: Text("Change Username", style: Theme.of(context).textTheme.headlineSmall,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(BakoSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("This username will be display as the display name in this application",
            style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(
              height: BakoSizes.spaceBtwSections,
            ),

            Form(key: controller.updateUserNameFormKey,
             child: Column(
              children: [
                TextFormField(
                  controller: controller.userName,
                  validator: (value) => BakoValidator.validateEmptyText("Username", value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: BakoTexts.username,
                    prefixIcon: Icon(Iconsax.user_edit),
                  ),
                ),
                const SizedBox(height: BakoSizes.spaceBtwInputFields),
              ],
             )),
             const SizedBox(height: BakoSizes.spaceBtwSections),

             SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName2(), child: const Text("Save")),
             )
          ],
        ) ,
        ),
    );
  }
}