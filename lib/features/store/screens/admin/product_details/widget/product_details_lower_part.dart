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
          """On top of all that, her parents told her yesterday that they were getting a divorce.The painting looked like something out of the 1700s.Growing up in Texas was very fun, and very muddy.I hope you won’t find it all too difficult to understand.My shoes are blue with yellow stripes and green stars on the front.I have always fed my dog the dog food that comes in the green bag.She considered reporting her landlord for inhospitable living conditions, but she was worried they would retaliate against her.You owe me one after what you did at my birthday party.Nikita is a perfectly respectable businessman.Why not go back to them and tell them you changed your mind?""",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: "Show more",
          trimExpandedText: " Show less",
          textAlign: TextAlign.justify,
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          )
      ],
    );
  }
}