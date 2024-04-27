import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/features/personalization/controllers/update_homeaddress_controller.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeHomeAddress extends StatelessWidget {
  const ChangeHomeAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateHomeAddressController());
    return Scaffold(
      appBar: BakoAppBar(
        showBackArrow: true,
        title: Text("Change Home Address", style: Theme.of(context).textTheme.headlineSmall,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(BakoSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("This home address will be display and store in this application",
            style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(
              height: BakoSizes.spaceBtwSections,
            ),

            Form(key: controller.updateHomeAddressFormKey,
             child: Column(
              children: [
                TextFormField(
                  controller: controller.homeAddress,
                  validator: (value) => BakoValidator.validateEmptyText("homeAddress", value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: BakoTexts.homeAddress,
                    prefixIcon: Icon(Iconsax.location),
                  ),
                ),
                const SizedBox(height: BakoSizes.spaceBtwInputFields),
              ],
             )),
             const SizedBox(height: BakoSizes.spaceBtwSections),

             SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateHomeAddress(), child: const Text("Save")),
             )
          ],
        ) ,
        ),
    );
  }
}