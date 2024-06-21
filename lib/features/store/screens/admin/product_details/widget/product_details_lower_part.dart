import 'package:ecobako_app/common/widget/texts/module_item_title_text.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/features/store/models/product_model.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

class ProductDeatilsLowerPart extends StatelessWidget {
  const ProductDeatilsLowerPart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Details header
        const BakoSectionHeading(
          title: "Item Detail",
          showActionButton: false,
        ),
        const SizedBox(height: BakoSizes.spaceBtwItems),

        Row(children: [
          const BakoModuleItemTitleText(title: "Item ID:"),
          const SizedBox(width: BakoSizes.spaceBtwItems),
          BakoModuleItemTitleText(title: product.id),
        ]),
        const SizedBox(
          height: BakoSizes.spaceBtwItems,
        ),

        // Product Name
        Row(children: [
          const BakoModuleItemTitleText(title: "Item Name:"),
          const SizedBox(width: BakoSizes.spaceBtwItems),
          BakoModuleItemTitleText(title: product.productName),
        ]),
        const SizedBox(
          height: BakoSizes.spaceBtwItems,
        ),

        // Product Points
        Row(children: [
          const BakoModuleItemTitleText(title: "Points:"),
          const SizedBox(width: BakoSizes.spaceBtwItems),
          BakoModuleItemTitleText(title: (product.point).toString()),
        ]),
        const SizedBox(
          height: BakoSizes.spaceBtwItems,
        ),

        // Product Stock
        Row(children: [
          const BakoModuleItemTitleText(title: "Stock:"),
          const SizedBox(width: BakoSizes.spaceBtwItems),
          BakoModuleItemTitleText(title: (product.stock).toString()),
        ]),
        const SizedBox(
          height: BakoSizes.spaceBtwItems * 2.5,
        ),

        // Product Description
        const BakoSectionHeading(
          title: "Item Description",
          showActionButton: false,
        ),
        const SizedBox(
          height: BakoSizes.spaceBtwItems,
        ),

        ReadMoreText(
          product.productDescription,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: "Show more",
          trimExpandedText: " Show less",
          textAlign: TextAlign.justify,
          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
