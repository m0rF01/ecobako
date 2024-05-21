import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BakoConfirmRedeemMenu extends StatelessWidget {
  const BakoConfirmRedeemMenu({
    super.key, 
    required this.title, 
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: BakoSizes.spaceBtwItems/1.5),
        child: Row(
          children: [
            Expanded(flex: 5, child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis,)),
            Expanded(flex: 5, child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,)),
          ],
        ),
      ),
    );
  }
}