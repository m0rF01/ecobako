import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/data/repositories/authentication/admin_auth_repo.dart';
import 'package:ecobako_app/features/ecobako_point/controller/ecobako_point_controller.dart';
import 'package:ecobako_app/features/ecobako_point/widget/eco_point_qr_scan.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminPointAllocationScreen extends StatelessWidget {
  const AdminPointAllocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminPointController());
    final darkMode = BakoHelperFunctions.isDarkMode(context);
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
                key: controller.addPointFormKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.userID,
                            validator: (value) =>
                                BakoValidator.validateEmptyText(
                                    "User ID", value),
                            expands: false,
                            decoration: const InputDecoration(
                                labelText: BakoTexts.userID,
                                prefixIcon: Icon(Iconsax.user_edit)),
                          ),
                          
                        ),
                        const SizedBox(width: BakoSizes.spaceBtwInputFields),
                        GestureDetector(
                          onTap: () async {
                                final scannedData = await Get.to(
                                    () => const QRScannerScreen());
                                if (scannedData != null) {
                                  controller.userID.text = scannedData;
                                }
                              },
                          child: const Icon(Iconsax.scan_barcode, size: 35,),
                        )
                      ],
                    ),
                    // User ID

                    const SizedBox(height: BakoSizes.spaceBtwInputFields),

                    // PET Weight
                    TextFormField(
                      controller: controller.petWeight,
                      validator: (value) =>
                          BakoValidator.validateDecimalPlaces("PET Weight", value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: BakoTexts.weightPET,
                          prefixIcon: Icon(Iconsax.user_edit)),
                    ),
                    const SizedBox(height: BakoSizes.spaceBtwInputFields),

                    // HDPE Weight
                    TextFormField(
                      controller: controller.hdpeWeight,
                      validator: (value) =>
                          BakoValidator.validateDecimalPlaces("HDPE Weight", value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: BakoTexts.weightHDPE,
                          prefixIcon: Icon(Iconsax.user_edit)),
                    ),
                    const SizedBox(height: BakoSizes.spaceBtwInputFields),

                    // PP Weight
                    TextFormField(
                      controller: controller.ppWeight,
                      validator: (value) =>
                          BakoValidator.validateDecimalPlaces("PP Weight", value),
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
                        onPressed: ()  async {
                              await controller.addUserPoints();
                              controller.clearFields();
                            },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: BakoColors.buttonPrimary,
                            side: const BorderSide(
                                color: BakoColors.buttonPrimary)),
                        child: const Text(BakoTexts.addPoint),
                      ),
                    ),
                    const SizedBox(height: BakoSizes.spaceBtwSections),
                  ],
                )),
            const SizedBox(
              height: BakoSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () =>
                    AdminAuthenticationRepository.instance.logout(),
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: BakoColors.buttonPrimary)),
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      )
    ])));
  }
}


