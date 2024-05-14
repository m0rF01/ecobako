
import 'package:ecobako_app/features/store/screens/admin/product_details/widget/product_edit_details.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecobako_app/features/store/models/product_model.dart';

class ProductDetailsActionButton extends StatelessWidget {
  const ProductDetailsActionButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 80.0, // adjust as needed
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              // Add your first FAB button logic here
            },
            backgroundColor: BakoColors.primary,
            child: const Icon(
              Iconsax.scan_barcode,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              Get.to(() => AdminEditItemScreen(product: product),
                  arguments: product);
            },
            backgroundColor: BakoColors.primary,
            child: const Icon(
              Iconsax.edit,
              color: BakoColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
