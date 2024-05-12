import 'package:ecobako_app/common/widget/layouts/grid_layout.dart';
import 'package:ecobako_app/common/widget/shimmers/shimmer.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BakoVerticalProductShimmer extends StatelessWidget {
  const BakoVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return BakoGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BakoShimmerEffect(width: 100, height: 180),
            SizedBox(
              height: BakoSizes.spaceBtwItems,
            ),
            BakoShimmerEffect(width: 160, height: 15),
            SizedBox(
              height: BakoSizes.spaceBtwItems / 2,
            ),
            BakoShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
