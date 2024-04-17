import 'package:ecobako_app/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: BakoDeviceUtils.getAppBarHeight(),
      right: BakoSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),  
        child: const Text("Skip",
        style: TextStyle(
          color: BakoColors.primary, // Change the color to your desired color
        ),),
        
      )
    );
  }
}
