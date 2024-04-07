import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AdminStoreActionButton extends StatelessWidget {
  const AdminStoreActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Add your FAB button logic here
      },
      backgroundColor: BakoColors.white,
      child: const Icon(Iconsax.add),
    );
  }
}