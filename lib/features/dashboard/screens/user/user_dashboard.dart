import 'package:flutter/material.dart';
import 'package:ecobako_app/common/widget/analytic_details_card/user_analytic_card_verticel.dart';
import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/features/dashboard/controllers/user_dashboard_controller.dart';
import 'package:ecobako_app/features/dashboard/screens/user/widget/user_tier_card.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/features/dashboard/screens/user/widget/user_chart.dart';
import 'package:get/get.dart';

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserDashboardController.instance;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.resetDataFetched(); // Reset dataFetched flag
          await controller.fetchUserRecord();
          // await controller.fetchTransactions(); // Fetch user record again
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
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
                padding: const EdgeInsets.all(BakoSizes.defaultSpace),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() => UserAnalyticCardVertical(
                              title: 'HDPE',
                              value:
                                  "${controller.userDashboardData.value.hdpe.toString()} Kg",
                            )),
                        Obx(() => UserAnalyticCardVertical(
                              title: 'PP',
                              value:
                                  "${controller.userDashboardData.value.pp.toString()} Kg",
                            )),
                      ],
                    ),
                    const SizedBox(height: BakoSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() => UserAnalyticCardVertical(
                              title: 'PET',
                              value:
                                  "${controller.userDashboardData.value.pet.toString()} Kg",
                            )),
                        Obx(() => UserAnalyticCardVertical(
                              title: 'Collected Points',
                              value:
                                  "${controller.userDashboardData.value.totalEcoPoints.toString()} Points",
                            )),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: BakoSizes.spaceBtwItems,
              ),
              const PieChartProgressIndicator(
              ),
              const SizedBox(
                height: BakoSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
