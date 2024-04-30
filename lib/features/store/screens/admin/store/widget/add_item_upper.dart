import 'package:ecobako_app/common/widget/custom_shape/curved_edges/curved_edges_widget.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AddItemUpper extends StatelessWidget {
  const AddItemUpper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return BakoCurvedEdgeWidget(
      child: Container(
        color: dark? BakoColors.darkerGrey : BakoColors.light,
        child: const Stack(
          children: [
            // main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(BakoSizes.productImageRadius*2),
                child: Center(
                  child: Image(
                    image: AssetImage(BakoImages.misegera)
                  )
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}