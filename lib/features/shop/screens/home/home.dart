import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/serach_container.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecobako_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

    @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BakoPrimaryHeaderContainer(
              child: Column(
                children: [
                  // appbar
                  BakoHomeAppBar(),
                  SizedBox(height: BakoSizes.spaceBtwSections),

                  // Search bar
                  BakoSaerchContaier(text: "Search Item"),
                  SizedBox(height: BakoSizes.spaceBtwSections),

                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: BakoSizes.defaultSpace),
                    child: Column(
                      children: [

                        //Heading
                        BakoSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white,),
                        SizedBox(height: BakoSizes.spaceBtwItems),

                        //Categories
                        BakoHomeCategories(),
                        ],
                    ),
                    ),

                    SizedBox(height: BakoSizes.spaceBtwSections,)
                ],
              ) 
            ),
          ],
        ),
      ),
    );
  }
}





