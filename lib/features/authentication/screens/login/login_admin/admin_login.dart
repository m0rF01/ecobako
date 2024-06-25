// use and checked
import 'package:ecobako_app/common/styles/spacing_styles.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_admin/widget/admin_login_form.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_admin/widget/admin_login_header.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

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
              AdminLoginHeader(dark: dark),

              /// Form
              const AdminLoginForm(),
            ],
          ),)
      )
    );
  }
}








