// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:ecobako_app/features/transaction/model/transaction_model.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:get/get.dart';

// // // class TransactionRepository extends GetxController {
// // //   final FirebaseFirestore _db = FirebaseFirestore.instance;
// // //   final FirebaseAuth _auth = FirebaseAuth.instance;

// // //   Future<List<TransactionModel>> getTransactionHistory(
// // //       // {DateTime? date, DateTime? month}) async {
// // //       {DateTime? date, DateTime? month}) async {
// // //     final User? user = _auth.currentUser;
// // //     if (user == null) {
// // //       return []; // User not authenticated
// // //     }

// // //     Query query =
// // //         _db.collection('Users').doc(user.uid).collection('Transactions');

// // //     if (date != null) {
// // //       final startOfDay = DateTime(date.year, date.month, date.day);
// // //       final endOfDay =
// // //           DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
// // //       query = query
// // //           .where('date', isGreaterThanOrEqualTo: startOfDay)
// // //           .where('date', isLessThanOrEqualTo: endOfDay);
// // //     } else if (month != null) {
// // //       final startOfMonth = DateTime(month.year, month.month, 1);
// // //       final endOfMonth = DateTime(month.year, month.month + 1, 1)
// // //           .subtract(const Duration(milliseconds: 1));
// // //       query = query
// // //           .where('date', isGreaterThanOrEqualTo: startOfMonth)
// // //           .where('date', isLessThanOrEqualTo: endOfMonth);
// // //     }

// // //     final querySnapshot = await query.orderBy('date', descending: true).get();

// // //     // final DateFormat formatter = DateFormat('dd/MM/yyyy');

// // //     // return querySnapshot.docs.map((doc) {
// // //     //   final data = doc.data();
// // //     //   // Format the date
// // //     //   final Timestamp timestamp = data['date'];
// // //     //   final DateTime dateTime = timestamp.toDate();
// // //     //   final String formattedDate = formatter.format(dateTime);
// // //     //   // Create Transaction object and set the formatted date string
// // //     //   final transaction = Transaction.fromJson(data);
// // //     //   transaction.date = formattedDate;
// // //     //   return transaction;
// // //     // }).toList();

// // //     return querySnapshot.docs.map((doc) {
// // //       // final data = doc.data();
// // //       return TransactionModel.fromSnapshot(doc);
// // //     }).toList();
// // //   }

// // //   Future<void> createTransactionHistory({
// // //     required String userId,
// // //     required String type,
// // //     required bool isCredit,
// // //     required int amount,
// // //     required String logoType,
// // //   }) async {
// // //     final transaction = TransactionModel(
// // //       id: _db
// // //           .collection('Users')
// // //           .doc(userId)
// // //           .collection('Transactions')
// // //           .doc()
// // //           .id,
// // //       type: type,
// // //       isCredit: isCredit,
// // //       amount: amount,
// // //       date: Timestamp.now(), // Store as Timestamp
// // //       logoType: logoType,
// // //     );

// // //     await _db
// // //         .collection('Users')
// // //         .doc(userId)
// // //         .collection('Transactions')
// // //         .doc(transaction.id)
// // //         .set(transaction.toJson());
// // //   }
// // // }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:get/get.dart';
// // import 'package:ecobako_app/features/transaction/model/transaction_model.dart';

// // class TransactionRepository extends GetxController {
// //   final FirebaseFirestore _db = FirebaseFirestore.instance;
// //   final FirebaseAuth _auth = FirebaseAuth.instance;

// //   Future<List<TransactionModel>> getTransactionHistory({DateTime? month}) async {
// //     final User? user = _auth.currentUser;
// //     if (user == null) {
// //       return []; // User not authenticated
// //     }

// //     Query query = _db.collection('Users').doc(user.uid).collection('Transactions');

// //     if (month != null) {
// //       final startOfMonth = DateTime(month.year, month.month, 1);
// //       final endOfMonth = DateTime(month.year, month.month + 1, 1).subtract(const Duration(milliseconds: 1));
// //       query = query.where('date', isGreaterThanOrEqualTo: startOfMonth)
// //                    .where('date', isLessThanOrEqualTo: endOfMonth);
// //     }

// //     final querySnapshot = await query.orderBy('date', descending: true).get();

// //     return querySnapshot.docs.map((doc) {
// //       return TransactionModel.fromSnapshot(doc);
// //     }).toList();
// //   }

// //   Future<void> createTransactionHistory({
// //     required String userId,
// //     required String type,
// //     required bool isCredit,
// //     required int amount,
// //     required String logoType,
// //   }) async {
// //     final transaction = TransactionModel(
// //       id: _db.collection('Users').doc(userId).collection('Transactions').doc().id,
// //       type: type,
// //       isCredit: isCredit,
// //       amount: amount,
// //       date: Timestamp.now(), // Store as Timestamp
// //       logoType: logoType,
// //     );

// //     await _db
// //         .collection('Users')
// //         .doc(userId)
// //         .collection('Transactions')
// //         .doc(transaction.id)
// //         .set(transaction.toJson());
// //   }

// //   Future<List<TransactionModel>> getTransactionHistoryByDateRange(DateTime startDate, DateTime endDate) async {
// //   final User? user = _auth.currentUser;
// //   if (user == null) {
// //     return []; // User not authenticated
// //   }

// //   final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db
// //       .collection('Users')
// //       .doc(user.uid)
// //       .collection('Transactions')
// //       .where('date', isGreaterThanOrEqualTo: startDate, isLessThanOrEqualTo: endDate)
// //       .get();

// //   return querySnapshot.docs.map((doc) => TransactionModel.fromSnapshot(doc)).toList();
// // }

// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecobako_app/features/transaction/model/transaction_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class TransactionRepository {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<List<TransactionModel>> getTransactionHistoryByDateRange(DateTime startDate, DateTime endDate) async {
//     final User? user = _auth.currentUser;
//     if (user == null) {
//       return []; // User not authenticated
//     }

//     final QuerySnapshot querySnapshot = await _db
//         .collection('Users')
//         .doc(user.uid)
//         .collection('Transactions')
//         .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
//         .where('date', isLessThanOrEqualTo: Timestamp.fromDate(endDate))
//         .orderBy('date', descending: true)
//         .get();

//     return querySnapshot.docs
//         .map((doc) => TransactionModel.fromSnapshot(doc))
//         .toList();
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobako_app/features/transaction/model/transaction_model.dart';
import 'package:get/get.dart';

class TransactionRepository extends GetxController {
  final CollectionReference transactionCollection = FirebaseFirestore.instance.collection('Transactions');

  Future<void> logTransaction({required String userId, required String type, required int amount, required String description}) async {
    try {
      await transactionCollection.add({
        'userId': userId,
        'type': type,
        'amount': amount,
        'description': description,
        'date': Timestamp.now(), // Include the current timestamp
      });
    } catch (e) {
      throw "Error logging transaction: $e";
    }
  }

  Future<List<TransactionModel>> fetchUserTransactions(String userId) async {
    try {
      // Query transactions for the specified user
      final querySnapshot = await transactionCollection.where('userId', isEqualTo: userId).orderBy('date', descending: true).limit(5).get();

      // Convert query snapshot to a list of TransactionModel objects
      return querySnapshot.docs.map((doc) => TransactionModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw "Error fetching user transactions: $e";
    }
  }
}
