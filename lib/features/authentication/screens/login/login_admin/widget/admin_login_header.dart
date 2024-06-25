// use and checked
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class AdminLoginHeader extends StatelessWidget {
  const AdminLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? BakoImages.lightAppLogo : BakoImages.darkAppLogo),
        ),
        Text(
          BakoTexts.adminLoginTitle, 
          style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: BakoSizes.sm),
        Text(
          BakoTexts.adminLoginSubTitle, 
          style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}