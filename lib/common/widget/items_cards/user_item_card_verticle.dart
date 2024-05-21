import 'package:ecobako_app/common/styles/shadow.dart';
import 'package:ecobako_app/common/widget/images/bako_roundimage.dart';
import 'package:ecobako_app/common/widget/rounded_container/rounded_container.dart';
import 'package:ecobako_app/common/widget/texts/module_item_title_text.dart';
import 'package:ecobako_app/features/store/models/product_model.dart';
import 'package:ecobako_app/features/store/screens/user/product_details/user_product_details.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BakoUserItemCardVertical extends StatelessWidget {
  const BakoUserItemCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // final controller = ProductController.instance;
    final dark = BakoHelperFunctions.isDarkMode(context);
    // final heroTag = 'product-hero-${product.id}';
    return GestureDetector(
      onTap: () => Get.to(() => UserProductDetail(product: product)),
      // onTap: () {
      //   Get.to(() => UserProductDetail(product: product),
      //       arguments: {'heroTag': heroTag});
      // },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [BakoShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(BakoSizes.productImageRadius),
          color: dark ? BakoColors.darkerGrey : BakoColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail
            const SizedBox(
              height: BakoSizes.spaceBtwItems / 2,
            ),
            // BakoRoundedContainer(
            //   height: 180,
            //   width: 180,
            //   padding: const EdgeInsets.all(BakoSizes.sm),
            //   backgroundColor: dark ? BakoColors.dark : BakoColors.light,
            //   child: BakoRoundImage(
            //     imageUrl: product.productImage,
            //     applyImageRadius: true,
            //     isNetworkImage: true,
            //   ),
            // ),

            BakoRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(BakoSizes.sm),
              backgroundColor: dark ? BakoColors.dark : BakoColors.light,
              // child: Hero(
              //   tag: 'product-hero-${product.id}', // Unique Hero tag
                child: BakoRoundImage(
                  imageUrl: product.productImage,
                  applyImageRadius: true,
                  isNetworkImage: true,
                ),
              // ),
            ),

            const SizedBox(
              height: BakoSizes.spaceBtwItems / 2,
            ),

            // Title
            Padding(
              padding: const EdgeInsets.only(left: BakoSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main title
                  BakoModuleItemTitleText(
                    title: product.productName,
                    smallSize: false,
                    maxLines: 1,
                  ),
                  const SizedBox(height: BakoSizes.spaceBtwItems / 2),
                  Row(
                    // Sub title
                    children: [
                      Text("${(product.point).toString()} Points",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(width: BakoSizes.xs),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: BakoSizes.sm),
                  child: Text(
                    "Stock: ${(product.stock).toString()}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: BakoColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(BakoSizes.cardRadiusMd),
                        bottomRight:
                            Radius.circular(BakoSizes.productImageRadius),
                      )),
                  child: const SizedBox(
                    width: BakoSizes.iconLg * 1.2,
                    height: BakoSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.eye,
                        color: BakoColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )

            // Details
          ],
        ),
      ),
    );
  }
}
