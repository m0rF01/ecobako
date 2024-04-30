import 'package:ecobako_app/features/authentication/screens/signup/admin_signup/widget/admin_sign_up_form.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';


class AdminSignupScreen extends StatelessWidget {
  const AdminSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BakoSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                BakoTexts.signupTitle, 
                style: Theme.of(context).textTheme.headlineMedium
              ),
              const SizedBox(height: BakoSizes.spaceBtwSections),

              //Form
              const BakoAdminSignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

