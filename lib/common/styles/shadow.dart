import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BakoShadowStyle{

  static final verticalProductShadow = BoxShadow(
    color: BakoColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horzontalProductShadow = BoxShadow(
    color: BakoColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}