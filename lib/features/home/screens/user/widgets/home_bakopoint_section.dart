import 'package:ecobako_app/common/widget/images/bako_circular_image.dart';
import 'package:ecobako_app/common/widget/layouts/grid_layout.dart';
import 'package:ecobako_app/common/widget/rounded_container/rounded_container.dart';
import 'package:ecobako_app/features/store/screens/admin/store/user_store.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BakoPointSection extends StatelessWidget {
  const BakoPointSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BakoGridLayout(itemCount: 2, mainAxisExtent: 70,itemBuilder: (_, index){
      return GestureDetector(
      onTap: () => Get.to(() => const UserStoreScreen()),
      child: BakoRoundedContainer(
        padding: const EdgeInsets.all(BakoSizes.sm),
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: BakoCircularImage(
                isNetworkImage: false,
                image: BakoImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: BakoHelperFunctions.isDarkMode(context) ? BakoColors.white : BakoColors.black,
                ),
            ),
              const SizedBox(width: BakoSizes.spaceBtwItems/2,),
      
              Column (
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Redeem Point", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium,)
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
