import 'package:ecobako_app/features/dashboard/controllers/admin_dashboard_controller.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// // class BottomSheetHelper {
// //   static void openBottomSheet(BuildContext context, FilterController filterController) {
// //     showModalBottomSheet(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return _BottomSheetContent(filterController);
// //       },
// //     );
// //   }
// // }

// // class _BottomSheetContent extends StatelessWidget {
// //   final FilterController filterController;

// //   const _BottomSheetContent(this.filterController);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           const Text(
// //             "Choose a Type",
// //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //           ),
// //           ...["Plastic Collection", "User Information"].map((type) {
// //             return Obx(() => RadioListTile<String>(
// //               title: Text(type),
// //               value: type,
// //               groupValue: filterController.selectedType.value,
// //               onChanged: (String? value) {
// //                 filterController.selectedType.value = value!;
// //               },
// //             ));
// //           }),
// //           const SizedBox(height: 20),
// //           const Text(
// //             "Select Date Range",
// //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //           ),
// //           ListTile(
// //             title: Obx(() {
// //               final start = filterController.selectedStartDate.value;
// //               final end = filterController.selectedEndDate.value;
// //               final dateFormat = DateFormat('dd-MM-yyyy');
// //               return Text(
// //                 start == null || end == null
// //                     ? "No date range selected"
// //                     : "${dateFormat.format(start)} - ${dateFormat.format(end)}",
// //               );
// //             }),
// //             trailing: const Icon(Icons.calendar_today),
// //             onTap: () async {
// //               DateTimeRange? picked = await showDateRangePicker(
// //                 context: context,
// //                 firstDate: DateTime(2024),
// //                 lastDate: DateTime.now(),
// //               );
// //               if (picked != null) {
// //                 filterController.selectedStartDate.value = picked.start;
// //                 filterController.selectedEndDate.value = picked.end;
// //               }
// //             },
// //           ),
// //           const SizedBox(height: 20),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               ElevatedButton(
// //                 onPressed: filterController.resetFilters,
// //                 child: const Text("Reset"),
// //               ),
// //               Row(
// //                 children: [
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       // Handle the confirm action
// //                       Navigator.pop(context);
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: BakoColors.buttonPrimary,
// //                       side: const BorderSide(color: BakoColors.buttonPrimary)
// //                     ),
// //                     child: const Text("Confirm"),
// //                   ),
// //                   const SizedBox(width: 8),
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       // Handle the cancel action
// //                       Navigator.pop(context);
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.red,
// //                       side: const BorderSide(color: Colors.red)
// //                     ),
// //                     child: const Text(BakoTexts.fliterCancel),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }



// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';

// // // class FilterController extends GetxController {
// // //   var selectedType = ''.obs;
// // //   var selectedStartDate = Rxn<DateTime>();
// // //   var selectedEndDate = Rxn<DateTime>();

// // //   void resetFilters() {
// // //     selectedType.value = '';
// // //     selectedStartDate.value = null;
// // //     selectedEndDate.value = null;
// // //   }
// // // }

// // // class BottomSheetContent extends StatelessWidget {
// // //   const BottomSheetContent({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final FilterController filterController = Get.put(FilterController());
// // //     return 
// // //         Center(
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               Obx(() => DropdownButton<String>(
// // //                 value: filterController.selectedType.value,
// // //                 onChanged: (String? newValue) {
// // //                   filterController.selectedType.value = newValue ?? '';
// // //                 },
// // //                 items: ["Plastic Collection", "User Information"].map<DropdownMenuItem<String>>((String value) {
// // //                   return DropdownMenuItem<String>(
// // //                     value: value,
// // //                     child: Text(value),
// // //                   );
// // //                 }).toList(),
// // //               )),
// // //               ElevatedButton(
// // //                 onPressed: () {
// // //                   // Display selected type
// // //                   print('Selected Type: ${filterController.selectedType.value}');
// // //                 },
// // //                 child: Text('Show Selected Type'),
// // //               ),
// // //             ],
// // //           ),
// // //         );
// // //   }
// // // }



// class FilterDateBottomSheet extends StatelessWidget {
//   const FilterDateBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final filterController = Get.find<FilterController>();
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text('Filter Options', style: TextStyle(fontSize: 20)),
//           const SizedBox(height: 20),
//           Obx(() => DropdownButton<String>(
//             value: filterController.selectedType.value.isEmpty
//                 ? null
//                 : filterController.selectedType.value,
//             items: const [
//               DropdownMenuItem(
//                 value: 'plasticCollection',
//                 child: Text('Plastic Collection'),
//               ),
//               DropdownMenuItem(
//                 value: 'userInfo',
//                 child: Text('User Information'),
//               ),
//             ],
//             hint: const Text('Select Type'),
//             onChanged: (value) {
//               filterController.selectedType.value = value!;
//             },
//           )),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     DateTimeRange? picked = await showDateRangePicker(
//                       context: context,
//                       firstDate: DateTime(2000),
//                       lastDate: DateTime(2101),
//                     );
//                     if (picked != null) {
//                       filterController.selectedStartDate.value = picked.start;
//                       filterController.selectedEndDate.value = picked.end;
//                     }
//                   },
//                   child: const Text('Select Date Range'),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               Get.back();
//               // Trigger filter update in your data fetching logic here
//             },
//             child: const Text('Apply Filters'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               filterController.resetFilters();
//               Get.back();
//               // Trigger reset filter update in your data fetching logic here
//             },
//             child: const Text('Reset'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'filter_controller.dart';

class BottomSheetContent extends StatelessWidget {
  final FilterController filterController;

  const BottomSheetContent(this.filterController, {super.key});

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
          ...["Plastic Collection", "User Information"].map((type) {
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BakoColors.buttonPrimary,
                      side: const BorderSide(color: BakoColors.buttonPrimary)
                    ),
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
                      side: const BorderSide(color: Colors.red)
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
