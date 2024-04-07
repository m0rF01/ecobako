import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailsActionButton extends StatelessWidget {
  const ProductDetailsActionButton({
    super.key,
  });

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
            backgroundColor: BakoColors.white,
            child: const Icon(Iconsax.scan_barcode),
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              // Add your second FAB button logic here
            },
            backgroundColor: BakoColors.white,
            child: const Icon(Iconsax.edit),
          ),
        ),
      ],
    );
  }
}
