import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/device/device_utility.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BakoSaerchContaier extends StatelessWidget {
  const BakoSaerchContaier({
    super.key, 
    required this.text, 
    this.icon = Iconsax.search_normal, 
    this.showBackground = true, 
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {

    final dark = BakoHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BakoSizes.defaultSpace),
        child: Container(
          width: BakoDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(BakoSizes.md),
          decoration: BoxDecoration(
            color: showBackground ? dark ? BakoColors.dark : BakoColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(BakoSizes.cardRadiusLg),
            border: showBorder ?  Border.all(color: BakoColors.grey) : null
          ),
          child: Row(
            children: [
              Icon(icon, color: BakoColors.darkerGrey),
              const SizedBox(width: BakoSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      
      ),
    );
  }
}