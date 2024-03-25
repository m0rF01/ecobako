import 'package:ecobako_app/features/authentication/screens/choose_role/widget/choose_role_header.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class ChooseRole extends StatelessWidget {
  const ChooseRole({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(BakoSizes.defaultSpace),
          child:  ChooseRoleHeader(dark: dark),
      ),
    );
  }
}

