import 'package:flutter/material.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';

class UserAnalyticCardVertical extends StatelessWidget {
  const UserAnalyticCardVertical({
    super.key,
    this.showBackground = true,
  });

  final bool showBackground;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = BakoHelperFunctions.isDarkMode(context);

    return GestureDetector(
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: ShapeDecoration(
          color: showBackground
              ? isDarkMode
                  ? BakoColors.dark
                  : BakoColors.light
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1,
                color: isDarkMode
                    ? Colors.white.withOpacity(0.25)
                    : Colors.black.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(30),
          ),
          shadows: [
            BoxShadow(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.25)
                  : Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HDPE',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: BakoSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10.0), // Adjust the top padding as needed
              child: Text(
                '1.5 KG',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
