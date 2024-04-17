import 'package:ecobako_app/common/styles/spacing_styles.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: BakoSpacingStyle.paddingWithAppBarHeight *2 ,
          child: Column(
            children: [

            // Image
            Image(
              image: AssetImage(image), 
              width: BakoHelperFunctions.screenWidth()*0.6,
            ),
              const SizedBox(height: BakoSizes.spaceBtwSections),

              // Title & Subtitle
              Text(
                title, 
                style: Theme.of(context).textTheme.headlineMedium, 
                textAlign: TextAlign.center
              ),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              Text(
                subTitle, 
                style: Theme.of(context).textTheme.labelLarge, 
                textAlign: TextAlign.center
              ),
              const SizedBox(height: BakoSizes.spaceBtwItems),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed, 
                   style: ElevatedButton.styleFrom(
                backgroundColor: BakoColors.buttonPrimary),
                  child: const Text(BakoTexts.tContinue),
                  ),
              )


            ],),
        )
      ),
    );
  }
}