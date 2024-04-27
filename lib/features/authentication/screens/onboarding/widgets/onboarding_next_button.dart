import 'package:ecobako_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/device/device_utility.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? BakoColors.primary : Colors.black,
            side: const BorderSide(color: BakoColors.buttonPrimary),
          ),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
