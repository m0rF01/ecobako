import 'package:ecobako_app/common/widget/layouts/grid_layout.dart';
import 'package:ecobako_app/common/widget/module_cards/module_card_vertical.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AdminModule extends StatelessWidget {
  const AdminModule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BakoSizes.defaultSpace),
      child: Column(
        children: [
        const BakoSectionHeading(title: "Learning Module", showActionButton: false,),
        const SizedBox(height: BakoSizes.spaceBtwSections),
        BakoGridLayout(itemCount: 12, itemBuilder: (_, index) => const BakoModuleCardVertical()),
        ],
      ) ,
    );
  }
}