import 'package:ecobako_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ecobako_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecobako_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/device/device_utility.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
        // Horizontal Scrollable Pages
          PageView(
            children: const [
              OnBoardingPage(
                image: BakoImages.onBoardingImage1, 
                title: BakoText.onBoardingTitle1, 
                subTitle: BakoText.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: BakoImages.onBoardingImage2, 
                title: BakoText.onBoardingTitle2, 
                subTitle: BakoText.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: BakoImages.onBoardingImage3, 
                title: BakoText.onBoardingTitle3, 
                subTitle: BakoText.onBoardingSubTitle3,
              ),
            ],
          ),
        
        // Skip Button
        const OnBoardingSkip(),

        // Dot Navigation SmoothPageIndicator
        const OnBoardingDotNavigation(),

        // Circular Button
        OnBoardingNextButton()
        ],
      )
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return Positioned(
      right: BakoSizes.defaultSpace,
      bottom: BakoDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? BakoColors.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ) 
      );
  }
}


