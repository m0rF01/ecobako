import 'package:ecobako_app/common/widget/images/bako_circular_image.dart';
import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/common/widget/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
    // controller.user.refresh();
    return ListTile(
      leading: Obx(() {
                    final networkImage = controller.user.value.profilePicture;
                    final image = networkImage.isNotEmpty
                        ? networkImage
                        : BakoImages.userImage;
                    return controller.imageUploading.value
                        ? const BakoShimmerEffect(
                            width: 80,
                            height: 80,
                            radius: 80,
                          )
                        : BakoCircularImage(
                            image: image,
                            width: 50,
                            height: 50,
                            isNetworkImage: networkImage.isNotEmpty,
                          );
                  }),
      
      title: Text(
        controller.user.value.username, 
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: BakoColors.white),
      ),
      subtitle: Text(
        controller.user.value.id, 
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: BakoColors.white),
      ),
      trailing: IconButton(
        onPressed: () => controller.generateAndSaveQRCode(controller.user.value.id), 
        icon: const Icon(
          Iconsax.scan_barcode, 
          color: BakoColors.white,),
      ),
    );
  }
}