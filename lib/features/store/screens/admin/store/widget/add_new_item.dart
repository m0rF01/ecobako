import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/features/store/controllers/product_controller.dart';
import 'package:ecobako_app/features/store/screens/admin/store/widget/add_item_upper.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminAddItemScreen extends StatelessWidget {
  const AdminAddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
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
                    key: controller.addProductFormKey,
                      child: Column(
                    children: [
                      // Product ID
                      TextFormField(
                        controller: controller.productID,
                        validator: (value) =>
                        BakoValidator.validateEmptyText("Product ID", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: BakoTexts.productID,
                            prefixIcon: Icon(Iconsax.user_edit)),
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwInputFields),
                      // Product Name
                      TextFormField(
                        controller: controller.productName,
                        validator: (value) =>
                        BakoValidator.validateEmptyText("Product Name", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: BakoTexts.productName,
                            prefixIcon: Icon(Iconsax.user_edit)),
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwInputFields),

                      // Product Description
                      TextFormField(
                        controller: controller.productDesc,
                        validator: (value) =>
                        BakoValidator.validateEmptyText("Product Description", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: BakoTexts.productDesc,
                            prefixIcon: Icon(Iconsax.user_edit)),
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwInputFields),

                      // Product Point
                      TextFormField(
                        controller: controller.productPoint,
                        validator: (value) =>
                        BakoValidator.validateInteger(value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: BakoTexts.productPoint,
                            prefixIcon: Icon(Iconsax.user_edit)),
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwInputFields),

                      // Product Quantity
                      TextFormField(
                        controller: controller.productQuantity,
                        validator: (value) =>
                        BakoValidator.validateInteger(value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: BakoTexts.productQuantity,
                            prefixIcon: Icon(Iconsax.user_edit)),
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwSections),

                      // Generate Voucher button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.addNewProduct(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: BakoColors.buttonPrimary,
                              side: const BorderSide(
                                  color: BakoColors.buttonPrimary)),
                          child: const Text(BakoTexts.addProduct),
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
