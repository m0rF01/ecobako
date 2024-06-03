import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecobako_app/common/widget/analytic_details_card/user_analytic_card_verticel.dart';
import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/common/widget/layouts/analytic_grid_layout.dart';
import 'package:ecobako_app/features/dashboard/screens/user/widget/user_chart.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:intl/intl.dart';

class AdminDashboardScreen extends StatelessWidget {
  AdminDashboardScreen({super.key});

  final FilterController _filterController = Get.put(FilterController());

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Choose a Type",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...["Type 1", "Type 2", "Type 3"].map((type) {
                return Obx(() => RadioListTile<String>(
                      title: Text(type),
                      value: type,
                      groupValue: _filterController.selectedType.value,
                      onChanged: (String? value) {
                        _filterController.selectedType.value = value!;
                      },
                    ));
              }),
              // .toList(),
              const SizedBox(height: 20),
              const Text(
                "Select Date Range",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: Obx(() {
                  final start = _filterController.selectedStartDate.value;
                  final end = _filterController.selectedEndDate.value;
                  final dateFormat = DateFormat('dd-MM-yyyy');
                  return Text(
                    start == null || end == null
                        ? "No date range selected"
                        : "${dateFormat.format(start)} - ${dateFormat.format(end)}",
                  );
                }),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  DateTimeRange? picked = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2024),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    _filterController.selectedStartDate.value = picked.start;
                    _filterController.selectedEndDate.value = picked.end;
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _filterController.resetFilters,
                    child: const Text("Reset"),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle the confirm action
                          Navigator.pop(context);
                        },
                        child: const Text("Confirm"),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Handle the cancel action
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("Cancel"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

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
                          onPressed: () => _openBottomSheet(context),
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
            const PieChartProgressIndicator(
              progress: 0.25,
            ),
            const SizedBox(
              height: BakoSizes.spaceBtwItems,
            ),
            Padding(
              padding: const EdgeInsets.all(
                BakoSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  BakoAnalyticGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const UserAnalyticCardVertical(),
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
