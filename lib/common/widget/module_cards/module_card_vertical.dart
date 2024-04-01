import 'package:ecobako_app/common/styles/shadow.dart';
import 'package:ecobako_app/common/widget/images/bako_roundimage.dart';
import 'package:ecobako_app/common/widget/rounded_container/rounded_container.dart';
import 'package:ecobako_app/common/widget/texts/Module_title_text.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BakoModuleCardVertical extends StatelessWidget {
  const BakoModuleCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: (){},
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
            const SizedBox(height: BakoSizes.spaceBtwItems/2,),
            BakoRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(BakoSizes.sm),
              backgroundColor: dark ? BakoColors.dark : BakoColors.light,
              child: const BakoRoundImage(imageUrl: BakoImages.productImage1, applyImageRadius: true,),
            ),
            const SizedBox(height: BakoSizes.spaceBtwItems/2,),

            // Title
             Padding(
              padding: const EdgeInsets.only(left: BakoSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main title
                  const BakoModuleTitleText(title: "Dunia Bahan terbuang", smallSize: false,),
                  const SizedBox(height: BakoSizes.spaceBtwItems/2),
                  Row(
                    // Sub title
                    children: [
                      Text("Adult Module 1", overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.bodyMedium),
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
                          "5 Minit",
                           maxLines: 1, 
                           overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Container(
                      decoration: const BoxDecoration(
                        color: BakoColors.dark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(BakoSizes.cardRadiusMd),
                          bottomRight: Radius.circular(BakoSizes.productImageRadius),
                        )
                      ),
                      child: const SizedBox(
                        width: BakoSizes.iconLg * 1.2,
                        height: BakoSizes.iconLg * 1.2,
                        child: Center(
                          child: Icon(Iconsax.eye, color: BakoColors.white,),
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