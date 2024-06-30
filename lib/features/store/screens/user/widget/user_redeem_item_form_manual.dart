import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/features/store/controllers/redeem_item_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/popups/cancel_redeem_popup.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RedeemItemFormManual extends StatelessWidget {
  const RedeemItemFormManual({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RedeemItemController());
    // Create a new instance of GlobalKey<FormState> each time the widget is built
     controller.redeemItemFormKey = GlobalKey<FormState>();

    return PopScope(
      canPop: false,
      onPopInvoked: ((didPop) async {
        if (didPop) {
          // If the user tries to navigate back from the Redeem Item screen
          return;
        }
        bool shouldCancel =
            await DialogUtils.showCancelConfirmationDialog(context);
        if (shouldCancel) {
          // You can perform any additional actions if needed
          Get.back();
        }
      }),
      child: Scaffold(
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
                            prefixIcon: Icon(Iconsax.box_search),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: BakoSizes.spaceBtwItems),
                  TextFormField(
                    controller: controller.quantityController,
                    validator: (value) =>
                        BakoValidator.validateEmptyText("Item Quantity", value),
                    decoration: const InputDecoration(
                      labelText: BakoTexts.redeemProductQuantity,
                      prefixIcon: Icon(Iconsax.shopping_cart),
                    ),
                  ),
                  const SizedBox(height: BakoSizes.spaceBtwItems),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.validateAndProceed();
                      controller.clearFields();
                    },
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
      ),
    );
  }
}
