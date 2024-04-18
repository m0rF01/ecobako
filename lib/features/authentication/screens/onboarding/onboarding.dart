import 'package:ecobako_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ecobako_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ecobako_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecobako_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return  Scaffold(
      body: Stack(
        children: [
        // Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: BakoImages.onBoardingImage1, 
                title: BakoTexts.onBoardingTitle1, 
                subTitle: BakoTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: BakoImages.onBoardingImage2, 
                title: BakoTexts.onBoardingTitle2, 
                subTitle: BakoTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: BakoImages.onBoardingImage3, 
                title: BakoTexts.onBoardingTitle3, 
                subTitle: BakoTexts.onBoardingSubTitle3,
              ),
            ],
          ),
        
        // Skip Button
        const OnBoardingSkip(),

        // Dot Navigation SmoothPageIndicator
        const OnBoardingDotNavigation(),

        // Circular Button
        const OnBoardingNextButton()
        ],
      )
    );
  }
}


