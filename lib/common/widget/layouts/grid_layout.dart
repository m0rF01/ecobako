import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BakoGridLayout extends StatelessWidget {
  const BakoGridLayout({
    super.key, 
    required this.itemCount, 
    this.mainAxisExtent = 288,
    required this.itemBuilder, 
    this.crossAxisCount = 2,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final int crossAxisCount;
  final Widget? Function(BuildContext, int) itemBuilder;


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: BakoSizes.gridViewSpacing,
        crossAxisSpacing: BakoSizes.gridViewSpacing
      ), 
      itemBuilder: itemBuilder
    );
  }
}