import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/device/device_utility.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartProgressIndicator extends StatefulWidget {
  const PieChartProgressIndicator(
      {super.key, required this.progress, this.showBackground = true});

  final double progress;
  final bool showBackground;

  @override
  State<StatefulWidget> createState() => PieChartProgressIndicatorState();
}

class PieChartProgressIndicatorState extends State<PieChartProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: BakoDeviceUtils.getScreenWidth(context),
      decoration: ShapeDecoration(
        color: widget.showBackground
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
                    child: PieChart(
                      PieChartData(
                        sections: showingSections(),
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 0,
                        centerSpaceRadius: size / 4,
                        startDegreeOffset: 270,
                      ),
                    ),
                  );
                },
              ),
            ),
            // const SizedBox(height: BakoSizes.defaultSpace),
            Text('250/1000', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: BakoSizes.defaultSpace),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final double remainingProgress = 1.0 - widget.progress;
    final List<PieChartSectionData> sections = [];

    sections.add(
      PieChartSectionData(
        color: BakoColors.primary,
        value: widget.progress,
        radius: 50,
        title: '${(widget.progress * 100).toInt()}%',
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: BakoColors.primaryBackground,
        ),
      ),
    );

    sections.add(
      PieChartSectionData(
        color: BakoColors.darkGrey,
        value: remainingProgress,
        title: "",
        radius: 50,
      ),
    );

    return sections;
  }
}
