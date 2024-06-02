import 'package:ecobako_app/common/widget/analytic_details_card/user_analytic_card_verticel.dart';
import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/common/widget/layouts/analytic_grid_layout.dart';
import 'package:ecobako_app/features/dashboard/screens/user/widget/user_chart.dart';
import 'package:ecobako_app/features/dashboard/screens/user/widget/user_tier_card.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BakoPrimaryHeaderContainer(
              child: Column(
                children: [
                  BakoAppBar(
                    title: Text(
                      "Performance Analytics",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: BakoColors.white),
                    ),
                  ),
                  const SizedBox(height: BakoSizes.spaceBtwSections),
                ],
              ),
            ),
            const SizedBox(
              height: BakoSizes.spaceBtwItems / 2,
            ),
            const TierCard(),
            const SizedBox(
              height: BakoSizes.spaceBtwItems / 2,
            ),
            Padding(
              padding: const EdgeInsets.all(
                BakoSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  BakoAnalyticGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) =>
                          const UserAnalyticCardVertical()),
                ],
              ),
            ),
            const SizedBox(
              height: BakoSizes.spaceBtwItems,
            ),
            const PieChartProgressIndicator(
              progress: 0.25,
            ),
            const SizedBox(
              height: BakoSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
