import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BakoSocialButton extends StatelessWidget {
  const BakoSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: BakoColors.grey), 
            borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image (
              width: BakoSizes.iconMd,
              height: BakoSizes.iconMd,
              image:AssetImage(BakoImages.google),
            ),
          ),
        ),
        const SizedBox(width: BakoSizes.spaceBtwInputFields),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: BakoColors.grey), 
            borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image (
              width: BakoSizes.iconMd,
              height: BakoSizes.iconMd,
              image:AssetImage(BakoImages.facebook),
            ),
          ),
        )
      ],
    );
  }
}