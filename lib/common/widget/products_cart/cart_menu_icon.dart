import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BakoCartCounterIcon extends StatelessWidget {
  const BakoCartCounterIcon({
    super.key, 
    required this.iconColor, 
    required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Iconsax.shopping_bag, color: BakoColors.white,)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: BakoColors.black,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: Text(
                "2", 
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  color: BakoColors.white, 
                  fontSizeFactor: 0.8)
              )
            ),
          ),
        )
      ],
    );
  }
}