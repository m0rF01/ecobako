import 'package:ecobako_app/common/widget/loaders/animation_loader.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BakoFullScreenLoader{
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false, 
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: BakoHelperFunctions.isDarkMode(Get.context!) ? BakoColors.dark: BakoColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              BakoAnimationLoaderWidget(text: text, animation: animation)
            ],
          ),
        )
      )
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}