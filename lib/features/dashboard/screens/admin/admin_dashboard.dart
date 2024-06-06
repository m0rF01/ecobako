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
    return Scaffold(
      body: SingleChildScrollView(
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
                          onPressed: () => BottomSheetHelper.openBottomSheet(context, _filterController),
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
            // const TierCard(),
            const SizedBox(
              height: BakoSizes.spaceBtwItems / 2,
            ),
            // const PieChartProgressIndicator(
            //   progress: 0.25,
            // ),
            const SizedBox(
              height: BakoSizes.spaceBtwItems,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(
            //     BakoSizes.defaultSpace,
            //   ),
            //   child: Column(
            //     children: [
            //       BakoAnalyticGridLayout(
            //         itemCount: 4,
            //         itemBuilder: (_, index) => const UserAnalyticCardVertical(),
            //       ),
            //     ],
            //   ),
            // ),
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
