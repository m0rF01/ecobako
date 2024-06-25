// use and checked
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BakoCircularContainer extends StatelessWidget {
  const BakoCircularContainer({
    super.key, 
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child, 
    this.backgroundColor = BakoColors.white
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: BakoColors.textWhite.withOpacity(0.1),
      ),
      child: child,
    );
  }
}