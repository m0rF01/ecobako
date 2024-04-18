import 'package:ecobako_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: BakoAppTheme.lightTheme,
      darkTheme: BakoAppTheme.darkTheme,
      home: const Scaffold(
        backgroundColor: BakoColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white)
        ),
      ),
      );
  }
}