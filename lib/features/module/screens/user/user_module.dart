import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/common/widget/layouts/grid_layout.dart';
import 'package:ecobako_app/common/widget/module_cards/module_card_vertical.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UserModuleScreen extends StatelessWidget {
  const UserModuleScreen({super.key});

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
                      "Learning Module", 
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: BakoColors.white),
                    ),
                  ),
                  const SizedBox(height: BakoSizes.spaceBtwSections),
                ],
            ),
            ),

            Padding(
              padding:  const EdgeInsets.all(BakoSizes.defaultSpace,),
              child: Column(
                children: [
                  BakoGridLayout(itemCount: 12, itemBuilder: (_, index) => const BakoModuleCardVertical()),
                ],
              ),
              )
          ],
        ),
      ),
    );
  }
}