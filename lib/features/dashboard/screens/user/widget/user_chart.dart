import 'package:ecobako_app/common/widget/shimmers/shimmer.dart';
import 'package:ecobako_app/features/dashboard/controllers/user_dashboard_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/device/device_utility.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PieChartProgressIndicator extends StatelessWidget {
  const PieChartProgressIndicator({super.key, this.showBackground = true});

  final bool showBackground;

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    final controller = UserDashboardController.instance;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: BakoDeviceUtils.getScreenWidth(context),
      decoration: ShapeDecoration(
        color: showBackground
            ? dark
                ? BakoColors.dark
                : BakoColors.light
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: dark
                ? Colors.white.withOpacity(0.25)
                : Colors.black.withOpacity(0.25),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        shadows: [
          BoxShadow(
            color: dark
                ? Colors.white.withOpacity(0.25)
                : Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Progress Indicator',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double size =
                      constraints.maxWidth < constraints.maxHeight
                          ? constraints.maxWidth
                          : constraints.maxHeight;
                  return SizedBox(
                    width: size,
                    height: size,
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return const BakoShimmerEffect(width: 10, height: 10);
                      } else {
                        final userDashboard =
                            controller.userDashboardData.value;
                        final progress = userDashboard.getProgress();
                        final nextTier = userDashboard.getNextTier();
                        // final nextTierThreshold = userDashboard.getNextTierThreshold();

                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: BakoColors.primary,
                                    value: progress * 100,
                                    radius: 50,
                                    title: '${(progress * 100).toInt()}%',
                                    titleStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: BakoColors.primaryBackground,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    color: BakoColors.darkGrey,
                                    value: 100 - (progress * 100),
                                    title: "",
                                    radius: 50,
                                  ),
                                ],
                                borderData: FlBorderData(show: false),
                                sectionsSpace: 3,
                                centerSpaceRadius: size / 4,
                                startDegreeOffset: 270,
                              ),
                            ),
                            if (nextTier != 'none')
                              Text(
                                'Next: $nextTier',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                          ],
                        );
                      }
                    }),
                  );
                },
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const BakoShimmerEffect(width: 10, height: 10);
              } else {
                final userDashboard = controller.userDashboardData.value;
                final nextTierThreshold = userDashboard.getNextTierThreshold();
                return Text(
                  "${userDashboard.totalAllPlastic} Kg / ${nextTierThreshold.toInt()} Kg",
                  style: Theme.of(context).textTheme.headlineSmall,
                );
              }
            }),
            const SizedBox(height: BakoSizes.defaultSpace),
          ],
        ),
      ),
    );
  }
}
