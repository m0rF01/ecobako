import 'package:ecobako_app/features/store/models/product_model.dart';
import 'package:ecobako_app/features/store/screens/user/widget/user_button_action.dart';
import 'package:ecobako_app/features/store/screens/user/widget/user_product_details_lower_part.dart';
import 'package:ecobako_app/features/store/screens/user/widget/user_product_details_upper_part.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UserProductDetail extends StatelessWidget {
  const UserProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-- 1 - product image
            UserProductDeatilsUpperPart(product: product),

            //-- 2 product details
            Padding(
              padding: const EdgeInsets.only(right: BakoSizes.defaultSpace, left: BakoSizes.defaultSpace, bottom: BakoSizes.defaultSpace),
              child: Column(
                children: [
                  // Title, price, stock
                  UserProductDeatilsLowerPart(product: product,),
                  const SizedBox(height: BakoSizes.spaceBtwItems,),
                ],
              ),
            ),

            const SizedBox(height: BakoSizes.spaceBtwItems*2,),

          ],
        ),
      ),
      floatingActionButton: const UserProductDetailsActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

