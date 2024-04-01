import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/images/bako_circular_image.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class BakoHomeAppBar extends StatelessWidget {
  const BakoHomeAppBar({
    super.key,
  });

@override
  Widget build(BuildContext context) {
    return BakoAppBar( // Adjust the spacing between title and leading widget
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                BakoTexts.userHomeAppbarTitle, 
                style: Theme.of(context).textTheme.labelMedium!.apply(color: BakoColors.grey),
              ),
              Text(
                BakoTexts.userHomeAppbarSubTitle, 
                style: Theme.of(context).textTheme.headlineSmall!.apply(color: BakoColors.white),
              ),
            ],
          ),
          const BakoCircularImage(
            image: BakoImages.userImage,
            width: 50,
            height: 50,
            padding: 0,
          ),
        ],
      ),
    );
  }
}