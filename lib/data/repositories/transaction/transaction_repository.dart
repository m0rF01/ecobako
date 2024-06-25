// use and checked
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
