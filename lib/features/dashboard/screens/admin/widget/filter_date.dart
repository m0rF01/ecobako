import 'package:ecobako_app/features/dashboard/controllers/admin_dashboard_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AdminDashboardController.instance;
    final scaffoldContext = context;

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
          ...["Plastic Collection", "User Information"].map((type) {
            return Obx(() => RadioListTile<String>(
                  title: Text(type),
                  value: type,
                  groupValue: controller.selectedType.value,
                  onChanged: (String? value) {
                    controller.selectedType.value = value!;
                  },
                ));
          }),
          const SizedBox(height: 20),
          const Text(
            "Select Date Range",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Obx(() {
              final start = controller.selectedStartDate.value;
              final end = controller.selectedEndDate.value;
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
                context: scaffoldContext,
                firstDate: DateTime(2024),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                controller.selectedStartDate.value = picked.start;
                controller.selectedEndDate.value = picked.end;
              }
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      side: const BorderSide(
                        color:  Colors.red,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(18.0), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15), // Padding around text
                    ),
                onPressed: () {
                  controller.resetFilters();
                },
                child: const Text("Reset"),
              ),
              Row(
                children: [
                  ElevatedButton(
                    // Inside onPressed of your ElevatedButton
                    onPressed: () async {
                      final currentContext =
                          context; // Store context before async call

                      // Check if both start and end dates are selected
                      if (controller.selectedStartDate.value != null &&
                          controller.selectedEndDate.value != null) {
                        // Determine which data fetching method to call based on selected type
                        if (controller.selectedType.value ==
                            "Plastic Collection") {
                          await controller.fetchAdminDashboardDataByFilterDate(
                            controller.selectedStartDate.value!,
                            controller.selectedEndDate.value!,
                          );
                        } else if (controller.selectedType.value ==
                            "User Information") {
                          await controller.fetchAdminDashboardDataByFilterDate(
                            controller.selectedStartDate.value!,
                            controller.selectedEndDate.value!,
                          );
                        }
                      } else {
                        // Handle case where dates are not selected
                        // Fetch default data or show error message
                        if (controller.selectedType.value ==
                            "Plastic Collection") {
                          await controller.fetchAdminDashboardData();
                        } else if (controller.selectedType.value ==
                            "User Information") {
                          await controller.fetchAdminDashboardData();
                        }
                      }

                      // Check if the context is still valid using mounted
                      if (currentContext.mounted) {
                        Navigator.pop(currentContext);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BakoColors.buttonPrimary,
                      side: const BorderSide(
                        color: BakoColors.buttonPrimary,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(18.0), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15), // Padding around text
                    ),
                    child: const Text("Confirm"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
