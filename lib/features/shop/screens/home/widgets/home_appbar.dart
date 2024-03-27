import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/products_cart/cart_menu_icon.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class BakoHomeAppBar extends StatelessWidget {
  const BakoHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BakoAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            BakoTexts.userHomeAppbarTitle, 
            style: Theme.of(context).textTheme.labelMedium!.apply(color: BakoColors.grey)
          ),
          Text(
            BakoTexts.userHomeAppbarSubTitle, 
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: BakoColors.white)
          ),
        ],
      ),
      actions: [
        BakoCartCounterIcon(onPressed: () {}, iconColor: BakoColors.white,)
      ], 
    );
  }
}