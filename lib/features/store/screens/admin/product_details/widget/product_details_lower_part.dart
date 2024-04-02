import 'package:ecobako_app/common/widget/texts/Module_title_text.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDeatilsLowerPart extends StatelessWidget {
  const ProductDeatilsLowerPart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name of the product
        BakoModuleTitleText(title: "Maggie Kari"),
        SizedBox(height: BakoSizes.spaceBtwItems/1.5,),

        // price
         BakoModuleTitleText(title: "600 points"),
        SizedBox(height: BakoSizes.spaceBtwItems/1.5,),

        //stock
        Row(
          children: [
          BakoModuleTitleText(title: "Stock:"),
          SizedBox(width: BakoSizes.spaceBtwItems),
          BakoModuleTitleText(title: "26"),
          ]
    )
      ],
    );
  }
}