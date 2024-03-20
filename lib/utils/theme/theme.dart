import 'package:ecobako_app/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:ecobako_app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ecobako_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ecobako_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:ecobako_app/utils/theme/custom_themes/eleveted_button_theme.dart';
import 'package:ecobako_app/utils/theme/custom_themes/outline_button_theme.dart';
import 'package:ecobako_app/utils/theme/custom_themes/text_field_theme.dart';
import 'package:ecobako_app/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class BakoAppTheme {
  BakoAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: BakoTextTheme.lightTextTheme,
    chipTheme: BakoChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: BakoAppBarTheme.lightAppBarTheme,
    checkboxTheme: BakoChcekBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: BakoBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: BakoElevetedButtonTheme.lightElevetedButtonTheme,
    outlinedButtonTheme: BakoOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: BakoTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: BakoTextTheme.darkTextTheme,
    chipTheme: BakoChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: BakoAppBarTheme.darkAppBarTheme,
    checkboxTheme: BakoChcekBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: BakoBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: BakoElevetedButtonTheme.darkElevetedButtonTheme,
    outlinedButtonTheme: BakoOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: BakoTextFormFieldTheme.darkInputDecorationTheme,
  );
}