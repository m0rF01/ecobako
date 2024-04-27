import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AdminPointAllocationScreen extends StatelessWidget {
  const AdminPointAllocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      BakoPrimaryHeaderContainer(
        child: Column(
          children: [
            // appBar
            BakoAppBar(
              title: Text(
                "Point Allocation",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: BakoColors.white),
              ),
            ),
            const SizedBox(height: BakoSizes.spaceBtwSections),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(BakoSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(BakoTexts.pointTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: BakoSizes.spaceBtwSections),
            Form(
                child: Column(
              children: [
                // User ID
                TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: BakoTexts.userID,
                      prefixIcon: Icon(Iconsax.user_edit)),
                ),
                const SizedBox(height: BakoSizes.spaceBtwInputFields),

                // PET Weight
                TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: BakoTexts.weightPET,
                      prefixIcon: Icon(Iconsax.user_edit)),
                ),
                const SizedBox(height: BakoSizes.spaceBtwInputFields),

                // HDPE Weight
                TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: BakoTexts.weightHDPE,
                      prefixIcon: Icon(Iconsax.user_edit)),
                ),
                const SizedBox(height: BakoSizes.spaceBtwInputFields),

                // PP Weight
                TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: BakoTexts.weightPP,
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
                        side:
                            const BorderSide(color: BakoColors.buttonPrimary)),
                    child: const Text(BakoTexts.addPoint),
                  ),
                ),
                const SizedBox(height: BakoSizes.spaceBtwSections),
              ],
            ))
          ],
        ),
      )
    ])));
  }
}
