import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/features/store/screens/admin/store/widget/add_item_upper.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AdminAddItemScreen extends StatelessWidget {
  const AdminAddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const BakoAppBar(
        showBackArrow: true,
        title: Text("Add new item"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddItemUpper(),
            Padding(
              padding: const EdgeInsets.all(BakoSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                      child: Column(
                    children: [
                      // User ID
                      TextFormField(
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: BakoTexts.itemName,
                            prefixIcon: Icon(Iconsax.user_edit)),
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwInputFields),

                      // PET Weight
                      TextFormField(
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: BakoTexts.itemDesc,
                            prefixIcon: Icon(Iconsax.user_edit)),
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwInputFields),

                      // HDPE Weight
                      TextFormField(
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: BakoTexts.itemPoint,
                            prefixIcon: Icon(Iconsax.user_edit)),
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwInputFields),

                      // PP Weight
                      TextFormField(
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: BakoTexts.itemQuantity,
                            prefixIcon: Icon(Iconsax.user_edit)),
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwSections),

                      // Generate Voucher button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: BakoColors.buttonPrimary,
                              side: const BorderSide(
                                  color: BakoColors.buttonPrimary)),
                          child: const Text(BakoTexts.addItem),
                        ),
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwSections),
                    ],
                  )),
                  const SizedBox(
                    height: BakoSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
