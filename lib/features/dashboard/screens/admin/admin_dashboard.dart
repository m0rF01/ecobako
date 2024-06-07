import 'package:ecobako_app/common/widget/analytic_details_card/admin_analytic_card_verticle.dart';
import 'package:ecobako_app/common/widget/analytic_details_card/user_analytic_card_verticel.dart';
import 'package:ecobako_app/features/dashboard/controllers/admin_dashboard_controller.dart';
import 'package:ecobako_app/features/dashboard/screens/admin/widget/admin_dashboard_chart.dart';
import 'package:ecobako_app/features/dashboard/screens/admin/widget/filter_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';

class AdminDashboardScreen extends StatelessWidget {
  AdminDashboardScreen({super.key});

  final FilterController _filterController = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    final controller = AdminDashboardController.instance;
    // final controller2 = UserDashboardController.instance;
    // final totalEcoPointsSum = controller.totalEcoPointsSum.value;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.resetDataFetched(); // Reset dataFetched flag
          await controller.fetchAdminDashboardData();
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
                          IconButton(
                            icon: const Icon(Iconsax.filter,
                                color: BakoColors.white),
                            onPressed: () => BottomSheetHelper.openBottomSheet(
                                context, _filterController),
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
              // const PieChartProgressIndicator(),
              // const PieChartProgressIndicator(
              const BarGraphPlasticInformation(),
              //   progress: 0.25,
              // ),
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
                        Obx(() => AdminAnalyticCardVertical(
                              title: 'PP',
                              value:
                                  "${controller.totalTypePPSum.value} Kg",
                            )),
                        Obx(() => AdminAnalyticCardVertical(
                              title: 'PET',
                              value:
                                  "${controller.totalTypePETSum.value} Kg",
                            )),
                      ],
                    ),
                    const SizedBox(height: BakoSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() => AdminAnalyticCardVertical(
                              title: 'HDPE',
                              value:
                                  "${controller.totalTypeHDPESum.value} Kg",
                            )),
                        Obx(() => AdminAnalyticCardVertical(
                              title: 'Total Recycled Plastic',
                              value:
                                  "${controller.totalAllPlasticSum.value} Kg",
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: BakoSizes.spaceBtwSections,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Download Data")),
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

class FilterController extends GetxController {
  var selectedType = ''.obs;
  var selectedStartDate = Rxn<DateTime>();
  var selectedEndDate = Rxn<DateTime>();

  void resetFilters() {
    selectedType.value = '';
    selectedStartDate.value = null;
    selectedEndDate.value = null;
  }
}
