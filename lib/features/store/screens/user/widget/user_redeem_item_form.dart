import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/features/store/controllers/redeem_item_controller.dart';
import 'package:ecobako_app/features/store/screens/user/widget/user_product_qr_scanner.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// class RedeemItemForm extends StatelessWidget {
//   const RedeemItemForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(RedeemItemController());
//     return AlertDialog(
//         title: Text("Redeem Product", style: Theme.of(context).textTheme.headlineSmall,),
//       // title: const Text('Redeem Item'),
//       // content: Form(
//         content: Padding(
//           padding: const EdgeInsets.all(BakoSizes.defaultSpace),
//           child: Form(
//           key: controller.redeemItemFormKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       controller: controller.productIdController,
//                       validator: (value) =>
//                           BakoValidator.validateEmptyText("Product ID", value),
//                       expands: false,
//                       decoration: const InputDecoration(
//                           labelText: BakoTexts.redeemProductID,
//                           prefix: Icon(Iconsax.user_edit)),
//                       // onSaved: (value) =>
//                       //     controller.productId.value = value ?? '',
//                     ),
//                   ),
//                   const SizedBox(width: BakoSizes.spaceBtwInputFields),
//                   GestureDetector(
//                     onTap: () async {
//                       // final scannedData =
//                       //     await Get.to(() => const UserProductQRScanner());
//                        final scannedData = await Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const UserProductQRScanner(),
//                         ),
//                       );

//                       if (scannedData != null) {
//                         controller.productIdController.text = scannedData;
//                       }
//                     },
//                     child: const Icon(
//                       Iconsax.scan_barcode,
//                       size: 35,
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(height: BakoSizes.spaceBtwItems),
//               TextFormField(
//                 controller: controller.quantityController,
//                 validator: (value) =>
//                     BakoValidator.validateEmptyText("Product Quantity", value),
//                 expands: false,
//                 decoration: const InputDecoration(
//                     labelText: BakoTexts.redeemProductQuantity,
//                     prefix: Icon(Iconsax.user_edit)),
//                 // onSaved: (value) =>
//                 //     controller.quantity.value = int.parse(value ?? '1'),
//               ),
//               const SizedBox(height: BakoSizes.spaceBtwItems),

//               // SizedBox(height: 16),
//               // ElevatedButton.icon(
//               //   onPressed: controller.scanQRCode,
//               //   icon: Icon(Icons.qr_code_scanner),
//               //   label: Text('Scan QR Code'),
//               // ),
//               const SizedBox(
//                 width: double.infinity,
//               ),
//               ElevatedButton(
//                 onPressed: controller.validateAndProceed,
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: BakoColors.buttonPrimary,
//                     side: const BorderSide(color: BakoColors.buttonPrimary)),
//                 child: const Text('Next'),
//               ),
//             ],
//           ),
//                 ),
//         ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// import 'qr_scanner_screen.dart';
// import 'redeem_item_controller.dart';
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/sizes.dart';
// import '../../../utils/constants/texts.dart';
// import '../../../utils/validators/validation.dart';

class RedeemItemForm extends StatelessWidget {
  const RedeemItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RedeemItemController());
    return Scaffold(
      appBar: const BakoAppBar(
        showBackArrow: true,
        title: Text("Redeem Item"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BakoSizes.defaultSpace),
          child: Form(
            key: controller.redeemItemFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.productIdController,
                        validator: (value) =>
                            BakoValidator.validateEmptyText("Item ID", value),
                        decoration: const InputDecoration(
                          labelText: BakoTexts.redeemProductID,
                          prefix: Icon(Iconsax.user_edit),
                        ),
                      ),
                    ),
                    const SizedBox(width: BakoSizes.spaceBtwInputFields),
                    GestureDetector(
                      onTap: () async {
                        // final scannedData = await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const UserProductQRScanner(),
                        //   ),
                        // );
           
                        final scannedData =
                            await Get.to(() => const UserProductQRScanner());
                        if (scannedData != null) {
                          controller.productIdController.text = scannedData;
                        }
                      },
                      child: const Icon(
                        Iconsax.scan_barcode,
                        size: 35,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: BakoSizes.spaceBtwItems),
                TextFormField(
                  controller: controller.quantityController,
                  validator: (value) =>
                      BakoValidator.validateEmptyText("Item Quantity", value),
                  decoration: const InputDecoration(
                    labelText: BakoTexts.redeemProductQuantity,
                    prefix: Icon(Iconsax.user_edit),
                  ),
                ),
                const SizedBox(height: BakoSizes.spaceBtwItems),
                ElevatedButton(
                  onPressed: controller.validateAndProceed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BakoColors.buttonPrimary,
                    side: const BorderSide(color: BakoColors.buttonPrimary),
                  ),
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
