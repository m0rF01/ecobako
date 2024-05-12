import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/images/bako_circular_image.dart';
import 'package:ecobako_app/features/personalization/controllers/admin_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/common/widget/shimmers/shimmer.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BakoAdminHomeAppBar extends StatelessWidget {
  const BakoAdminHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<AdminController>();
    final controller = Get.put(AdminController());
    return BakoAppBar(
      // Adjust the spacing between title and leading widget
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                BakoTexts.userHomeAppbarTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: BakoColors.grey),
              ),
              Obx(() {
                if (controller.profileLoading.value) {
                  return const BakoShimmerEffect(width: 80, height: 15);
                } else {
                  return Text(
                    controller.user.value.username,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: BakoColors.white),
                  );
                }
              }),
            ],
          ),
          Obx(() {
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
          // const BakoCircularImage(
          //   image: BakoImages.userImage,
          //   width: 50,
          //   height: 50,
          //   padding: 0,
          // ),
        ],
      ),
    );
  }
}
