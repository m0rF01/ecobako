import 'package:ecobako_app/common/widget/shimmers/shimmer.dart';
import 'package:ecobako_app/features/dashboard/controllers/admin_dashboard_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/device/device_utility.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarGraphUserInformation extends StatelessWidget {
  const BarGraphUserInformation({super.key, this.showBackground = true});

  final bool showBackground;

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    final controller = AdminDashboardController.instance;

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
              child: Text('User Infromation',
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
                        // final adminDashboard =
                        //     controller.adminDashboardData.value;
                        // final adminDashboardData = controller.adminDashboardData2.value;
                        final male =
                            controller.maleUsers.value;
                        final female = controller.femaleUsers.value;
                    

                        // Calculate the maximum value
                        final maxY = [
                          male,
                          female,
                        ].reduce((a, b) => a > b ? a : b);

                        return BarChart(
                          BarChartData(
                            barTouchData: BarTouchData(
                              enabled: false,
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 30,
                                  getTitlesWidget:
                                      (double value, TitleMeta meta) {
                                    const style = TextStyle(
                                      color: BakoColors.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    );
                                    String text;
                                    switch (value.toInt()) {
                                      case 0:
                                        text = 'Male';
                                        break;
                                      case 1:
                                        text = 'Female';
                                        break;
                                      default:
                                        text = '';
                                        break;
                                    }
                                    return SideTitleWidget(
                                      axisSide: meta.axisSide,
                                      space: 4,
                                      child: Text(text, style: style),
                                    );
                                  },
                                ),
                              ),
                              leftTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            barGroups: [
                              BarChartGroupData(
                                x: 0,
                                barRods: [
                                  BarChartRodData(
                                    toY: male.toDouble(),
                                    // toY: adminDashboard.pp,
                                    gradient: const LinearGradient(
                                      colors: [
                                        BakoColors.secondary,
                                        BakoColors.primary,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 1,
                                barRods: [
                                  BarChartRodData(
                                    toY: female.toDouble(),
                                    // toY: adminDashboard.pet,
                                    gradient: const LinearGradient(
                                      colors: [
                                        BakoColors.secondary,
                                        BakoColors.primary,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  )
                                ],
                                showingTooltipIndicators: [0],
                              ),
                            ],
                            gridData: const FlGridData(show: false),
                            alignment: BarChartAlignment.spaceAround,
                            maxY: maxY * 2,
                          ),
                        );
                      }
                    }),
                  );
                },
              ),
            ),
            const SizedBox(height: BakoSizes.defaultSpace),
          ],
        ),
      ),
    );
  }
}
