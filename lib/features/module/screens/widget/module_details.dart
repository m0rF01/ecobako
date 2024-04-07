import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/features/module/screens/widget/module_details_lower.dart';
import 'package:ecobako_app/features/module/screens/widget/module_upper_details.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ModuleDetails extends StatelessWidget {
  const ModuleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BakoAppBar(
        showBackArrow: true,
        title: Text("Adult Module 1"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-- 1 - product image
            ModuleDetailsUpperPart(),

            //-- 2 product details
            Padding(
              padding: EdgeInsets.only(right: BakoSizes.defaultSpace, left: BakoSizes.defaultSpace, bottom: BakoSizes.defaultSpace),
              child: Column(
                children: [
                  // Title, price, stock
                  ModuleDeatilsLowerPart(),
                  SizedBox(height: BakoSizes.spaceBtwItems,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}