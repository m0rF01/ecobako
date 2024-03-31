import 'package:ecobako_app/common/widget/images/bako_circular_image.dart';
import 'package:ecobako_app/common/widget/layouts/grid_layout.dart';
import 'package:ecobako_app/common/widget/rounded_container/rounded_container.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UserHomeTransactionHistory extends StatelessWidget {
  const UserHomeTransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
     return BakoGridLayout(itemCount: 4, mainAxisExtent: 70, crossAxisCount: 1,itemBuilder: (_, index){
      return GestureDetector(
      onTap: () {},
      child: BakoRoundedContainer(
        padding: const EdgeInsets.all(BakoSizes.sm),
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: BakoCircularImage(
                isNetworkImage: false,
                image: BakoImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: BakoHelperFunctions.isDarkMode(context) ? BakoColors.white : BakoColors.black,
                ),
            ),
              // const SizedBox(width: BakoSizes.spaceBtwItems/2,),
      
              Expanded(
                child: Column (
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Collection Point", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: BakoSizes.spaceBtwSections,),

                    Text(
                      "31 March 2024",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],  
                ),
              ), 
              // const SizedBox(width: BakoSizes.spaceBtwItems*9,),  

              Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                    Text(
                      "+123",
                      textAlign: TextAlign.right, // Align text to the right
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
              )               
          ],
        ),
      ),
    );
    
    }
    );
  }
}