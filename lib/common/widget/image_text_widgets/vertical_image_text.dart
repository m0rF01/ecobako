import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BakoVerticalImageText extends StatelessWidget {
  const BakoVerticalImageText({
    super.key, 
    required this.image, 
    required this.title, 
    this.textColor = BakoColors.white, 
    this.backgroundColor = BakoColors.white, 
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap : onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: BakoSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(BakoSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? BakoColors.black : BakoColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover, color: dark ? BakoColors.light : BakoColors.dark),
              ),
            ),
      
            //Text
            const SizedBox(height: BakoSizes.spaceBtwItems/2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        ),
    );
  }
}