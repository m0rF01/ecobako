import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/device/device_utility.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: BakoDeviceUtils.getBottomNavigationBarHeight(),
      left: BakoSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: PageController(), 
        count: 3,
        effect: ExpandingDotsEffect(activeDotColor: dark ? BakoColors.light: BakoColors.dark, dotHeight: 6),
        ),
    );
  }
}
