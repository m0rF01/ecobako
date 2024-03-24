import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BakoFormDivider extends StatelessWidget {
  const BakoFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? BakoColors.darkGrey: BakoColors.grey, 
            thickness: 0.5, 
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText, 
          style: Theme.of(context).textTheme.labelMedium
        ),
        Flexible(
          child: Divider(
            color: dark ? BakoColors.darkGrey: BakoColors.grey, 
            thickness: 0.5, 
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
