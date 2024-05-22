import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/features/store/controllers/product_controller.dart';
import 'package:ecobako_app/features/store/models/product_model.dart';
import 'package:ecobako_app/features/store/screens/admin/store/widget/edit_item_upper.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class AdminEditItemScreen extends StatefulWidget {
  const AdminEditItemScreen({super.key, required this.product});

  final ProductModel product;

  @override
  
  AdminEditItemScreenState createState() => AdminEditItemScreenState();
}

class AdminEditItemScreenState extends State<AdminEditItemScreen> {
  late ProductController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ProductController());

    // Set initial values for the text editing controllers
    controller.productID.text = widget.product.id;
    controller.productName.text = widget.product.productName;
    controller.productDesc.text = widget.product.productDescription;
    controller.productPoint.text = widget.product.point.toString();
    controller.productQuantity.text = widget.product.stock.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BakoAppBar(
        showBackArrow: true,
        title: Text("Edit item"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditItemUpper(product: widget.product),
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
                          onChanged: (newValue) {
                            controller.updateProductID(newValue);
                          },
                          validator: (value) =>
                              BakoValidator.validateEmptyText("Product ID", value),
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: BakoTexts.productID,
                            prefixIcon: Icon(Iconsax.user_edit),
                          ),
                        ),
                        const SizedBox(height: BakoSizes.spaceBtwInputFields),
                        // Product Name
                        TextFormField(
                          controller: controller.productName,
                          onChanged: (newValue) {
                            controller.updateProductName(newValue);
                          },
                          validator: (value) =>
                              BakoValidator.validateEmptyText("Product Name", value),
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: BakoTexts.productName,
                            prefixIcon: Icon(Iconsax.user_edit),
                          ),
                        ),
                        const SizedBox(height: BakoSizes.spaceBtwInputFields),
                        // Product Description
                        TextFormField(
                          controller: controller.productDesc,
                          onChanged: (newValue) {
                            controller.updateProductDesc(newValue);
                          },
                          validator: (value) =>
                              BakoValidator.validateEmptyText("Product Description", value),
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: BakoTexts.productDesc,
                            prefixIcon: Icon(Iconsax.user_edit),
                          ),
                        ),
                        const SizedBox(height: BakoSizes.spaceBtwInputFields),
                        // Product Point
                        TextFormField(
                          controller: controller.productPoint,
                          onChanged: (newValue) {
                            controller.updateProductPoint(newValue);
                          },
                          validator: (value) =>
                              BakoValidator.validateInteger(value),
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: BakoTexts.productPoint,
                            prefixIcon: Icon(Iconsax.user_edit),
                          ),
                        ),
                        const SizedBox(height: BakoSizes.spaceBtwInputFields),
                        // Product Quantity
                        TextFormField(
                          controller: controller.productQuantity,
                          onChanged: (newValue) {
                            controller.updateProductQuantity(newValue);
                          },
                          validator: (value) =>
                              BakoValidator.validateInteger(value),
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: BakoTexts.productQuantity,
                            prefixIcon: Icon(Iconsax.user_edit),
                          ),
                        ),
                        const SizedBox(height: BakoSizes.spaceBtwSections),
                        // Generate Voucher button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.addProductFormKey.currentState!
                                  .validate()) {
                                // Save the form details
                                controller.saveFormDetails();
                                // Proceed with updating the product
                                controller.updateProduct(widget.product);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: BakoColors.buttonPrimary,
                              side: const BorderSide(
                                  color: BakoColors.buttonPrimary),
                            ),
                            child: const Text(BakoTexts.updateProduct),
                          ),
                        ),
                        const SizedBox(height: BakoSizes.spaceBtwSections),

                        // Delete Product button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.showDeleteConfirmationDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Colors.red,
                              side: const BorderSide(
                                  color: Colors.red),
                            ),
                            child: const Text("Delete Product"),
                          ),
                        ),
                        const SizedBox(height: BakoSizes.spaceBtwSections),
                      ],
                    ),
                  ),
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


