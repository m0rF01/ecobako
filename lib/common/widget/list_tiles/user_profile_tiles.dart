import 'package:ecobako_app/common/widget/images/bako_circular_image.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BakoUserProfileTile extends StatelessWidget {
  const BakoUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const BakoCircularImage(
        image: BakoImages.userImage,
        width: 50,
        height: 50,
        padding: 0,
      ),
      
      title: Text(
        "Muhammad Faris", 
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: BakoColors.white),
      ),
      subtitle: Text(
        "User ID", 
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: BakoColors.white),
      ),
      trailing: IconButton(
        onPressed: () {}, 
        icon: const Icon(
          Iconsax.scan_barcode, 
          color: BakoColors.white,),
      ),
    );
  }
}