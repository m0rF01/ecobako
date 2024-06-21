import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/features/dashboard/controllers/download_data_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DownloadData extends StatelessWidget {
  const DownloadData({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DownloadEcoBakoDataController.instance;
    final scaffoldContext = context;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Download EcoBako Data to Excel",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
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
          const SizedBox(height: BakoSizes.spaceBtwSections * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  side: const BorderSide(
                    color: Colors.red,
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
                          horizontal: 20, vertical: 15), // Padding around text
                    ),
                    // call generate excel fucntion
                    onPressed: () async {
                      if (controller.selectedStartDate.value != null &&
                          controller.selectedEndDate.value != null) {
                        await controller.generateAndShareExcel(
                            controller.selectedStartDate.value!,
                            controller.selectedEndDate.value!);
                      } else {
                        BakoLoaders.errorSnackBar(
                            title: "Oh Snap!",
                            message:
                                "Please select the desired start and end date to download the data");
                      }
                    },

                    child: const Text("Download"),
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
