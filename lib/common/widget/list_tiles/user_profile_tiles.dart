import 'package:ecobako_app/common/widget/images/bako_circular_image.dart';
import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BakoUserProfileTile extends StatelessWidget {
  const BakoUserProfileTile({
    super.key, 
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const BakoCircularImage(
        image: BakoImages.userImage,
        width: 50,
        height: 50,
        padding: 0,
      ),
      
      title: Text(
        controller.user.value.username, 
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: BakoColors.white),
      ),
      subtitle: Text(
        controller.user.value.email, 
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