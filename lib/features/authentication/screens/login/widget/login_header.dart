import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class BakoLoginHeader extends StatelessWidget {
  const BakoLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? BakoImages.lightAppLogo : BakoImages.darkAppLogo),
        ),
        Text(BakoTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: BakoSizes.sm),
        Text(BakoTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}