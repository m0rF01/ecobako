import 'package:ecobako_app/common/widget/image_text_widgets/vertical_image_text.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class BakoHomeCategories extends StatelessWidget {
  const BakoHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index){
          return BakoVerticalImageText(image: BakoImages.shoeIcon , title: 'shoe', onTap: (){},);
        }
        ),
    );
  }
}



