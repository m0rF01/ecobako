import 'package:ecobako_app/common/widget/texts/module_item_title_text.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

class ProductDeatilsLowerPart extends StatelessWidget {
  const ProductDeatilsLowerPart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name of the product
        BakoSectionHeading(title: "Product Detail", showActionButton: false,),
        SizedBox(height: BakoSizes.spaceBtwItems),

        BakoModuleItemTitleText(title: "Maggie Kari"),
        SizedBox(height: BakoSizes.spaceBtwItems/1.5,),

        // price
        BakoModuleItemTitleText(title: "600 points"),
        SizedBox(height: BakoSizes.spaceBtwItems/1.5,),

        //stock
        Row(
          children: [
          BakoModuleItemTitleText(title: "Stock:"),
          SizedBox(width: BakoSizes.spaceBtwItems),
          BakoModuleItemTitleText(title: "26"),
          ]   
        ),
        SizedBox(height: BakoSizes.spaceBtwItems,),

        // Product Description
        BakoSectionHeading(title: "Description", showActionButton: false,),
        SizedBox(height: BakoSizes.spaceBtwItems,),
        ReadMoreText(
          "jkdncsldacjkdvj dbcubasdbchkadcabdc jbdcahkbckhasdbcdhaca cdbhasbchabdlchkakbdcahkc dbchabdchbadcbasdbcyadsc n dchabhcbahbsdljcbhasdc bcasdcbd",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: "Show more",
          trimExpandedText: " Show less",
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          )
      ],
    );
  }
}