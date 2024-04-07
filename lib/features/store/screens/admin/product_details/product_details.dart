import 'package:ecobako_app/features/store/screens/admin/product_details/widget/product_button_action.dart';
import 'package:ecobako_app/features/store/screens/admin/product_details/widget/product_details_lower_part.dart';
import 'package:ecobako_app/features/store/screens/admin/product_details/widget/product_details_upper_part.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AdminProductDetail extends StatelessWidget {
  const AdminProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-- 1 - product image
            ProductDeatilsUpperPart(),

            //-- 2 product details
            Padding(
              padding: EdgeInsets.only(right: BakoSizes.defaultSpace, left: BakoSizes.defaultSpace, bottom: BakoSizes.defaultSpace),
              child: Column(
                children: [
                  // Title, price, stock
                  ProductDeatilsLowerPart(),
                  SizedBox(height: BakoSizes.spaceBtwItems,),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ProductDetailsActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

