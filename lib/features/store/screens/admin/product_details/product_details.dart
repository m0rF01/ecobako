import 'package:ecobako_app/features/store/models/product_model.dart';
import 'package:ecobako_app/features/store/screens/admin/product_details/widget/product_button_action.dart';
import 'package:ecobako_app/features/store/screens/admin/product_details/widget/product_details_lower_part.dart';
import 'package:ecobako_app/features/store/screens/admin/product_details/widget/product_details_upper_part.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AdminProductDetail extends StatelessWidget {
  const AdminProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Hero(
        tag: "adminProduct",
        child: SingleChildScrollView(
          child: Column(
            children: [
              //-- 1 - product image
              ProductDeatilsUpperPart(product: product),
        
              //-- 2 product details
               Padding(
                padding: const EdgeInsets.only(right: BakoSizes.defaultSpace, left: BakoSizes.defaultSpace, bottom: BakoSizes.defaultSpace),
                child: Column(
                  children: [
                    // Title, price, stock
                    ProductDeatilsLowerPart(product: product),
                    const SizedBox(height: BakoSizes.spaceBtwItems,),
                  ],
                ),
              )
            ],
            
          ),
        ),
      ),
      floatingActionButton: const ProductDetailsActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

