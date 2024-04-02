import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/common/widget/layouts/grid_layout.dart';
import 'package:ecobako_app/common/widget/module_cards/module_card_vertical.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AdminStoreScreen extends StatelessWidget {
  const AdminStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BakoPrimaryHeaderContainer(
              child: Column(
                children: [
                  // appBar
                  BakoAppBar(
                    title: Text(
                      "EcoBako Store", 
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: BakoColors.white),
                    ),
                  ),
                  const SizedBox(height: BakoSizes.spaceBtwSections),
                ],
            ),
            ),

            //body
             Padding(

              padding: const EdgeInsets.all(BakoSizes.defaultSpace),
              child: Column(
                children: [
                  const BakoSectionHeading(title: "List of Items", showActionButton: false,),
                  const SizedBox(height: BakoSizes.spaceBtwSections),
                  BakoGridLayout(itemCount: 12, itemBuilder: (_, index) => const BakoModuleCardVertical()),
                ],
              ) ,
             )
          ],
        ),
      ),
    );
  }
}