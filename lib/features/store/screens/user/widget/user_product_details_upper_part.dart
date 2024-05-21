import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/curved_edges/curved_edges_widget.dart';
import 'package:ecobako_app/common/widget/images/bako_roundimage.dart';
import 'package:ecobako_app/features/store/models/product_model.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProductDeatilsUpperPart extends StatelessWidget {
  const UserProductDeatilsUpperPart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
   
    return BakoCurvedEdgeWidget(
      child: Container(
        color: dark ? BakoColors.darkerGrey : BakoColors.light,
        child: Stack(
          children: [
            // main large image
            SizedBox(
                height: 400,
                child: Padding(
                  padding:
                      const EdgeInsets.all(BakoSizes.productImageRadius * 2),
                  child: Center(
                      child: BakoRoundImage(
                    imageUrl: product.productImage,
                    isNetworkImage: true,
                    applyImageRadius: true,
                  )),
                )),

            const BakoAppBar(
              showBackArrow: true,
            )
          ],
        ),
      ),
    );
  }
}
