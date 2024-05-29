// // // import 'package:ecobako_app/data/repositories/transaction/transaction_repository.dart';
// // // import 'package:ecobako_app/features/transaction/model/transaction_model.dart';
// // // import 'package:get/get.dart';

// // // class TransactionHistoryController extends GetxController {
// // //   final transactionRepository = Get.put(TransactionRepository());
// // //   // var transactions = <Transaction>[].obs;
// // //   RxList<TransactionModel> transactions = <TransactionModel>[].obs;
// // //   var isLoading = true.obs;
// // //   var startDate = Rx<DateTime?>(null);
// // //   var endDate = Rx<DateTime?>(null);

// // //   @override
// // //   void onInit() {
// // //     super.onInit();
// // //     fetchTransactionHistory();
// // //   }

// // //   Future<void> fetchTransactionHistory() async {
// // //     isLoading.value = true;
// // //     transactions.value = await transactionRepository.getTransactionHistory();
// // //     isLoading.value = false;
// // //   }

// // //   // Future<void> filterTransactionsByDate(DateTime date) async {
// // //   //   isLoading.value = true;
// // //   //   transactions.value = await transactionRepository.getTransactionHistory(date: date);
// // //   //   isLoading.value = false;
// // //   // }

// // //   Future<void> filterTransactionsByMonth(DateTime month) async {
// // //     isLoading.value = true;
// // //     transactions.value = await transactionRepository.getTransactionHistory(month: month);
// // //     isLoading.value = false;
// // //   }

// // //   Future<void> filterTransactionsByDateRange(DateTime startDate, DateTime endDate) async {
// // //   isLoading.value = true;
// // //   transactions.value = await transactionRepository.getTransactionHistoryByDateRange(startDate, endDate);
// // //   isLoading.value = false;
// // // }

// // // }

// // // import 'package:get/get.dart';
// // // import 'package:ecobako_app/features/transaction/model/transaction_model.dart';
// // // import 'package:ecobako_app/data/repositories/transaction/transaction_repository.dart';

// // // class TransactionHistoryController extends GetxController {
// // //   final TransactionRepository _transactionRepository = TransactionRepository();
// // //   final RxList<TransactionModel> transactions = <TransactionModel>[].obs;
// // //   final RxBool isLoading = true.obs;
// // //   DateTime? startDate;
// // //   DateTime? endDate;

// // //   @override
// // //   void onInit() {
// // //     super.onInit();
// // //     fetchTransactionHistory();
// // //   }

// // //   Future<void> fetchTransactionHistory() async {
// // //     isLoading.value = true;
// // //     transactions.value = await _transactionRepository.getTransactionHistoryByDateRange();
// // //     isLoading.value = false;
// // //   }
// // // }

// // import 'package:get/get.dart';
// // import 'package:ecobako_app/features/transaction/model/transaction_model.dart';
// // import 'package:ecobako_app/data/repositories/transaction/transaction_repository.dart';

// // class TransactionHistoryController extends GetxController {
// //   final TransactionRepository _transactionRepository = TransactionRepository();
// //   final RxList<TransactionModel> transactions = <TransactionModel>[].obs;
// //   final RxBool isLoading = true.obs;
// //   DateTime? startDate = DateTime.now();
// //   DateTime? endDate = DateTime.now();

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     fetchTransactionHistory();
// //   }

// //   Future<void> fetchTransactionHistory() async {
// //     if (startDate == null || endDate == null) {
// //       // Handle the case where startDate or endDate is null
// //       return;
// //     }
// //     isLoading.value = true;
// //     transactions.value = await _transactionRepository
// //         .getTransactionHistoryByDateRange(startDate!, endDate!);
// //     isLoading.value = false;
// //   }
// // }

// // ----------------------------------------------------------------new
// import 'package:ecobako_app/data/repositories/transaction/transaction_repository.dart';
// import 'package:ecobako_app/data/repositories/user/user_repository.dart';
// import 'package:ecobako_app/features/transaction/model/transaction_model.dart';
// import 'package:get/get.dart';

// class TransactionController extends GetxController {
//   final userRepository = UserRepository();
//   final transactionRepository = TransactionRepository();
//   RxList<TransactionModel> transactions = <TransactionModel>[].obs;
//   final String userId;
//   final TransactionRepository transactionRepositoryy;

//   TransactionController(this.transactionRepositoryy,this.userId);

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserTransactions();
//   }

//   Future<void> fetchUserTransactions() async {
//     try {
//       final fetchedTransactions =
//           await transactionRepository.fetchUserTransactions(userId);
//       transactions.value = fetchedTransactions;
//     } catch (e) {
//       // Handle error
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:ecobako_app/features/transaction/model/transaction_model.dart';
import 'package:ecobako_app/data/repositories/transaction/transaction_repository.dart';

class TransactionController extends GetxController {
  final TransactionRepository transactionRepository;
  final String userId;

  TransactionController(this.transactionRepository, this.userId);

  RxList<TransactionModel> transactions = <TransactionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserTransactions();
  }

  Future<void> fetchUserTransactions() async {
    try {
      final fetchedTransactions = await transactionRepository.fetchUserTransactions(userId);
      transactions.value = fetchedTransactions;
    } catch (e) {
      // Handle error
    }
  }
}

