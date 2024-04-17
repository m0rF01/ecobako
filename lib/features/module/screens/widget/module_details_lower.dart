import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

class ModuleDeatilsLowerPart extends StatelessWidget {
  const ModuleDeatilsLowerPart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name of the product
        BakoSectionHeading(
          title: "Dunia Bahan Terbuang",
          showActionButton: false,
        ),
        SizedBox(height: BakoSizes.spaceBtwSections),

        ReadMoreText(
          """She got stressed out whenever she saw a notification on her email. The game looked fun, but all the pieces were missing. A big tree in the field was struck by lightning. Sales have dropped off at every department store. I caught a catfish yesterday with my bare hands. I can tell you're angry about the time change. That's the biggest grasshopper I've ever seen. She created an app to match zombies with willing victims. My mom drove me to school fifteen minutes late on Tuesday. Let's all just take a moment to breathe, please!""",
          textAlign: TextAlign.justify,
          // trimLines: 1,
          // trimMode: TrimMode.Line,
          // trimCollapsedText: "Show more",
          // trimExpandedText: " Show less",
          // moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          // lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
