import 'package:ecobako_app/common/widget/analytic_details_card/admin_analytic_card_verticle.dart';
import 'package:ecobako_app/features/dashboard/controllers/admin_dashboard_controller.dart';
import 'package:ecobako_app/features/dashboard/screens/admin/widget/admin_dashboard_chart1.dart';
import 'package:ecobako_app/features/dashboard/screens/admin/widget/admin_dashboard_chart2.dart';
import 'package:ecobako_app/features/dashboard/screens/admin/widget/filter_date.dart';
import 'package:ecobako_app/features/dashboard/screens/admin/widget/filter_download.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AdminDashboardController.instance;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.resetDataFetched(); // Reset dataFetched flag
          await controller.fetchAdminDashboardData();
          await controller.fetchAdminDashboardDataByFilterDate();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              BakoPrimaryHeaderContainer(
                child: Column(
                  children: [
                    BakoAppBar(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Performance Analytics",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .apply(color: BakoColors.white),
                          ),
                          const SizedBox(width: BakoSizes.inputFieldRadius),
                          IconButton(
                            icon: const Icon(Iconsax.filter,
                                color: BakoColors.white),
                            onPressed: () => showModalBottomSheet(
                              context: context,
                              builder: (context) => const BottomSheetContent(),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Iconsax.document_download,
                                color: BakoColors.white),
                            onPressed: () => showModalBottomSheet(
                              context: context,
                              builder: (context) => const DownloadData(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: BakoSizes.spaceBtwSections),
                  ],
                ),
              ),
              const SizedBox(
                height: BakoSizes.spaceBtwItems / 2,
              ),
              // Conditionally show either BarGraphPlasticInformation or BarGraphUserInformation
              Obx(() {
                if (controller.selectedType.value == "Plastic Collection") {
                  return const BarGraphPlasticInformation();
                } else if (controller.selectedType.value ==
                    "User Information") {
                  return const BarGraphUserInformation();
                } else {
                  return const SizedBox(); // Fallback if none matched
                }
              }),
              const SizedBox(
                height: BakoSizes.spaceBtwItems,
              ),
              Padding(
                padding: const EdgeInsets.all(BakoSizes.defaultSpace),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() {
                          if (controller.selectedType.value ==
                              "Plastic Collection") {
                            return AdminAnalyticCardVertical(
                              title: 'PP',
                              value: "${controller.totalTypePPSum.value} Kg",
                            );
                          } else {
                            return AdminAnalyticCardVertical(
                              title: 'Active User',
                              value: "${controller.totalActiveUser.value} User",
                            );
                          }
                        }),
                        Obx(() {
                          if (controller.selectedType.value ==
                              "Plastic Collection") {
                            return AdminAnalyticCardVertical(
                              title: 'PET',
                              value: "${controller.totalTypePETSum.value} Kg",
                            );
                          } else {
                            return AdminAnalyticCardVertical(
                              title: 'Top Performer',
                              value: controller.mostPerformantUsername.value,
                            );
                          }
                        }),
                      ],
                    ),
                    const SizedBox(height: BakoSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() {
                          if (controller.selectedType.value ==
                              "Plastic Collection") {
                            return AdminAnalyticCardVertical(
                              title: 'HDPE',
                              value: "${controller.totalTypeHDPESum.value} Kg",
                            );
                          } else {
                            return AdminAnalyticCardVertical(
                              title: 'Total EcoBako Points',
                              value:
                                  "${controller.totalGeneratedPoint.value} Points",
                            );
                          }
                        }),
                        Obx(() {
                          if (controller.selectedType.value ==
                              "Plastic Collection") {
                            return AdminAnalyticCardVertical(
                              title: 'Total Recycled Plastic',
                              value:
                                  "${controller.totalAllPlasticOverallSum.value} Kg",
                            );
                          } else {
                            return AdminAnalyticCardVertical(
                              title: 'Total Recycled Plastic',
                              value:
                                  "${controller.totalAllPlasticOverallSum.value} Kg",
                            );
                          }
                        }),
                      ],
                    ),
                  ],
                ),
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
