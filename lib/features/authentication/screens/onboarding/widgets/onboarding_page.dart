// use and checked
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, 
    required this.image,
    required this.title, 
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BakoSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: BakoHelperFunctions.screenWidth() * 0.8,
            height: BakoHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title, 
            style: Theme.of(context).textTheme.headlineMedium, 
            textAlign: TextAlign.center
          ),
          const SizedBox(height: BakoSizes.spaceBtwItems),
          Text(
            subTitle, 
            style: Theme.of(context).textTheme.bodyMedium, 
            textAlign: TextAlign.center
          ),
        ],
      )
    );
  }
}