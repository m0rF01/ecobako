import 'package:ecobako_app/features/dashboard/screens/admin/admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class BottomSheetHelper {
  static void openBottomSheet(BuildContext context, FilterController filterController) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _BottomSheetContent(filterController);
      },
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  final FilterController filterController;

  const _BottomSheetContent(this.filterController);

  @override
  Widget build(BuildContext context) {
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
              groupValue: filterController.selectedType.value,
              onChanged: (String? value) {
                filterController.selectedType.value = value!;
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
              final start = filterController.selectedStartDate.value;
              final end = filterController.selectedEndDate.value;
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
                filterController.selectedStartDate.value = picked.start;
                filterController.selectedEndDate.value = picked.end;
              }
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: filterController.resetFilters,
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
  }
}
