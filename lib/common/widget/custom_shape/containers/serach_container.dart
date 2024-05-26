import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/common/widget/shimmers/shimmer.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/device/device_utility.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BakoPointContainer extends StatelessWidget {
  const BakoPointContainer({
    super.key,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.textColor,
  });

  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    final controller = Get.find<UserController>();
    //final controller = Get.find();
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: BakoSizes.defaultSpace),
          child: Container(
            width: BakoDeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.all(BakoSizes.md),
            decoration: BoxDecoration(
                color: showBackground
                    ? dark
                        ? BakoColors.dark
                        : BakoColors.light
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(BakoSizes.cardRadiusLg),
                border: showBorder ? Border.all(color: BakoColors.grey) : null),
            child: Column(
              children: [
                Text("EcoBako Points",
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: BakoSizes.spaceBtwItems),
                // Text(point,style: Theme.of(context).textTheme.headlineLarge),
                Obx(() {
                  if (controller.profileLoading.value) {
                    return const BakoShimmerEffect(width: 100, height: 100);
                  } else {
                    return Text(
                      controller.user.value.ecoPoint.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .apply(color: textColor),
                    );
                  }
                }),
                // Text(point, style: Theme.of(context).textTheme.headlineLarge),
              ],
            ),
          ),
        ));
  }
}
