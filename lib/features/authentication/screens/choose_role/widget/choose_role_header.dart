import 'package:ecobako_app/features/authentication/screens/login/login_admin/admin_login.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_user/login.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseRoleHeader extends StatelessWidget {
  const ChooseRoleHeader({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // image
        Image(
            height: 150,
            image: AssetImage(
                dark ? BakoImages.lightAppLogo : BakoImages.darkAppLogo)),
        const SizedBox(height: BakoSizes.spaceBtwSections),
        // title and subtitle
        Text(
          BakoTexts.chooseRoleTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: BakoSizes.spaceBtwItems),

        Text(
          BakoTexts.chooseRoleSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: BakoSizes.spaceBtwSections * 10),

        Text(
          BakoTexts.chooseRoleDetails,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: BakoSizes.spaceBtwItems),

        // button for user
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const LoginScreen()),
            style: ElevatedButton.styleFrom(
                backgroundColor: BakoColors.buttonPrimary,
                side: const BorderSide(color: BakoColors.buttonPrimary)),
            child: const Text(BakoTexts.userRole),
          ),
        ),
        const SizedBox(height: BakoSizes.spaceBtwSections),

        // button for admin
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const AdminLoginScreen()),
            style: ElevatedButton.styleFrom(
                backgroundColor: BakoColors.buttonPrimary,
                side: const BorderSide(color: BakoColors.buttonPrimary)),
            child: const Text(BakoTexts.adminRole),
          ),
        ),
        const SizedBox(height: BakoSizes.spaceBtwSections),
      ],
    );
  }
}
