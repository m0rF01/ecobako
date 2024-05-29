// // import 'package:ecobako_app/features/transaction/controllers/transaction_controllers.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:intl/intl.dart';

// // class TransactionHistoryPage extends StatefulWidget {
// //   const TransactionHistoryPage({super.key});

// //   @override
// //   TransactionHistoryPageState createState() => TransactionHistoryPageState();
// // }

// // class TransactionHistoryPageState extends State<TransactionHistoryPage> {
// //   final TransactionHistoryController controller = Get.put(TransactionHistoryController());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Transaction History'),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.filter_list),
// //             onPressed: () {
// //               _showDateRangePicker(context);
// //             },
// //           ),
// //         ],
// //       ),
// //       body: controller.isLoading.value
// //           ? const Center(child: CircularProgressIndicator())
// //           : controller.transactions.isEmpty
// //               ? const Center(child: Text('No transactions found'))
// //               : ListView.builder(
// //                   itemCount: controller.transactions.length,
// //                   itemBuilder: (context, index) {
// //                     final transaction = controller.transactions[index];
// //                     final dateTime = transaction.date.toDate();
// //                     final formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

// //                     return ListTile(
// //                       leading: Icon(transaction.logoType == 'add' ? Icons.add : Icons.remove),
// //                       title: Text(transaction.type),
// //                       subtitle: Text(formattedDate),
// //                       trailing: Text(
// //                         transaction.isCredit ? '+${transaction.amount}' : '-${transaction.amount}',
// //                         style: TextStyle(color: transaction.isCredit ? Colors.green : Colors.red),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //     );
// //   }

// // void _showDateRangePicker(BuildContext context) async {
// //   DateTime? startDate = DateTime.now();
// //   DateTime? endDate = DateTime.now();

// //   final selectedDates = await showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return AlertDialog(
// //         title: const Text('Select Date Range'),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             ListTile(
// //               title: const Text('Start Date'),
// //               onTap: () async {
// //                 startDate = await showDatePicker(
// //                   context: context,
// //                   initialDate: startDate!,
// //                   firstDate: DateTime(2020),
// //                   lastDate: DateTime(2101),
// //                 );
// //               },
// //             ),
// //             ListTile(
// //               title: const Text('End Date'),
// //               onTap: () async {
// //                 endDate = await showDatePicker(
// //                   context: context,
// //                   initialDate: endDate!,
// //                   firstDate: DateTime(2020),
// //                   lastDate: DateTime(2101),
// //                 );
// //               },
// //             ),
// //           ],
// //         ),
// //         actions: [
// //           ElevatedButton(
// //             onPressed: () {
// //               Navigator.of(context).pop([startDate, endDate]);
// //             },
// //             child: const Text('Apply'),
// //           ),
// //         ],
// //       );
// //     },
// //   );

// //   if (selectedDates != null) {
// //     final DateTime selectedStartDate = selectedDates[0];
// //     final DateTime selectedEndDate = selectedDates[1];
// //     // Call fetchTransactionHistory with the selected date range
// //     controller.fetchTransactionHistory(selectedStartDate, selectedEndDate);
// //   }
// // }

// // }

// import 'package:ecobako_app/features/transaction/controllers/transaction_controllers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// class TransactionHistoryPage extends StatelessWidget {
//   const TransactionHistoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TransactionHistoryController controller = Get.put(TransactionHistoryController());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Transaction History'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.filter_list),
//             onPressed: () {
//               _showDateRangePicker(context, controller);
//             },
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (controller.transactions.isEmpty) {
//           return const Center(child: Text('No transactions found'));
//         }

//         return ListView.builder(
//           itemCount: controller.transactions.length,
//           itemBuilder: (context, index) {
//             final transaction = controller.transactions[index];
//             final dateTime = transaction.date.toDate();
//             final formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

//             return ListTile(
//               leading: Icon(transaction.logoType == 'add' ? Icons.add : Icons.remove),
//               title: Text(transaction.type),
//               subtitle: Text(formattedDate),
//               trailing: Text(
//                 transaction.isCredit ? '+${transaction.amount}' : '-${transaction.amount}',
//                 style: TextStyle(color: transaction.isCredit ? Colors.green : Colors.red),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }

//  void _showDateRangePicker(BuildContext context, TransactionHistoryController controller) async {
//   DateTime? startDate = DateTime.now();
//   DateTime? endDate = DateTime.now();

//   final selectedDates = await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return FutureBuilder(
//         future: Future.wait([
//           showDatePicker(
//             context: context,
//             initialDate: startDate!,
//             firstDate: DateTime(2020),
//             lastDate: DateTime(2101),
//           ),
//           showDatePicker(
//             context: context,
//             initialDate: endDate!,
//             firstDate: DateTime(2020),
//             lastDate: DateTime(2101),
//           ),
//         ]),
//         builder: (context, AsyncSnapshot<List<DateTime?>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             startDate = snapshot.data![0];
//             endDate = snapshot.data![1];
//             return AlertDialog(
//               title: const Text('Select Date Range'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ListTile(
//                     title: const Text('Start Date'),
//                     onTap: () {
//                       // No need for further action since the date picker already updates startDate
//                     },
//                   ),
//                   ListTile(
//                     title: const Text('End Date'),
//                     onTap: () {
//                       // No need for further action since the date picker already updates endDate
//                     },
//                   ),
//                 ],
//               ),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop([startDate, endDate]);
//                   },
//                   child: const Text('Apply'),
//                 ),
//               ],
//             );
//           }
//         },
//       );
//     },
//   );

//  if (selectedDates != null) {
//     final TransactionHistoryController controller = Get.find<TransactionHistoryController>();
//     controller.startDate = selectedDates[0];
//     controller.endDate = selectedDates[1];
//     controller.fetchTransactionHistory();
//   }
// }

// }
