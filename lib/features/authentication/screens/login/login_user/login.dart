import 'package:ecobako_app/common/styles/spacing_styles.dart';
import 'package:ecobako_app/common/widget/login_signup/form_divider.dart';
import 'package:ecobako_app/common/widget/login_signup/social_buttons.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_user/widget/login_form.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_user/widget/login_header.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: BakoSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title, subtitle
              BakoLoginHeader(dark: dark),

              /// Form
              const BakoLoginForm(),
          
              // Divider
              BakoFormDivider(dividerText: BakoTexts.orSignInWith.capitalize!),

              const SizedBox(height: BakoSizes.spaceBtwSections),

              //Footer
              const BakoSocialButton()
            ],
          ),)
      )
    );
  }
}





