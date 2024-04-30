import 'package:ecobako_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BakoTermsAndConditionCheckbox extends StatelessWidget {
  const BakoTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = BakoHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24, 
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value, 
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: BakoSizes.spaceBtwItems,),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${BakoTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall
              ),
              TextSpan(
                text: '${BakoTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? BakoColors.white : BakoColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? BakoColors.white : BakoColors.primary,
                )
              ),
              TextSpan(
                text: '${BakoTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall
              ),
              TextSpan(
                text: '${BakoTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? BakoColors.white : BakoColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? BakoColors.white : BakoColors.primary,
                )
              ),
            ] 
          ),
        ),
      ],
    );
  }
}