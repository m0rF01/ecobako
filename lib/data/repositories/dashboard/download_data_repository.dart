import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DownloadEcoBakoData extends GetxController {
  static DownloadEcoBakoData get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  // Function to fetch Users data from Firestore with date filter
  // Future<List<Map<String, dynamic>>> fetchUsersData(DateTime startDate, DateTime endDate) async {
  //   try {

  //     endDate = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59, 999);

  //     final QuerySnapshot snapshot = await _db
  //         .collection('Users')
  //         .where('dateField', isGreaterThanOrEqualTo: startDate)
  //         .where('dateField', isLessThanOrEqualTo: endDate)
  //         .get();

  //     List<Map<String, dynamic>> usersData = snapshot.docs.map((DocumentSnapshot doc) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

  //       // Filter and select only the desired fields
  //       return {
  //         'Address': data['Address'] ?? '',
  //         'Age': data['Age'] ?? '',
  //         'EcoPoint': data['EcoPoint'] ?? '',
  //         'Email': data['Email'] ?? '',
  //         'FirstName': data['FirstName'] ?? '',
  //         'Gender': data['Gender'] ?? '',
  //         'LastName': data['LastName'] ?? '',
  //         'PhoneNumber': data['PhoneNumber'] ?? '',
  //         'Role': data['Role'] ?? '',
  //         'Username': data['Username'] ?? '',
  //       };
  //     }).toList();

  //     return usersData;
  //   } catch (e) {
  //     print('Error fetching users data: $e');
  //     return [];
  //   }
  // }

  // // Function to fetch Transaction data from Firestore with date filter
  // Future<List<Map<String, dynamic>>> fetchTransactionData(DateTime startDate, DateTime endDate) async {
  //   try {
  //     endDate = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59, 999);
  //     final QuerySnapshot snapshot = await _db
  //         .collection('Transactions')
  //         .where('date', isGreaterThanOrEqualTo: startDate)
  //         .where('date', isLessThanOrEqualTo: endDate)
  //         .get();

  //     List<Map<String, dynamic>> transactionData = snapshot.docs.map((DocumentSnapshot doc) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

  //       // Filter and select only the desired fields
  //       return {
  //         'amount': data['amount'] ?? '',
  //         'date': data['date'] ?? '',
  //         'description': data['description'] ?? '',
  //         'type': data['type'] ?? '',
  //         'userId': data['userId'] ?? '',
  //       };
  //     }).toList();

  //     return transactionData;
  //   } catch (e) {
  //     print('Error fetching transaction data: $e');
  //     return [];
  //   }
  // }

  // Future<QuerySnapshot<Map<String, dynamic>>> getUsersInDateRange(DateTime startDate, DateTime endDate) async {
  //   return await _db.collection('Users')
  //       .where('Date', isGreaterThanOrEqualTo: startDate)
  //       .where('Date', isLessThanOrEqualTo: endDate)
  //       .get();
  // }

  Future<List<Map<String, dynamic>>> getDataUsers(
      ) async {
    QuerySnapshot snapshot = await _db
        .collection('Users')
        // .where('date', isGreaterThanOrEqualTo: startDate)
        // .where('date', isLessThanOrEqualTo: endDate)
        .get();
    return snapshot.docs.map((doc) {
      return {
        'UserId': doc.id,
        'FirstName': doc['FirstName'],
        'LastName': doc['LastName'],
        'Username': doc['Username'],
        'EcoBakoPoint': doc['EcoPoint'].toString(),
        'Email': doc['Email'],
        'Age': doc['Age'],
        'Gender': doc['Gender'],
        'Address': doc['Address'],
        'PhoneNumber': doc['PhoneNumber'],
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> getDataAdminDashboard(
      DateTime startDate, DateTime endDate) async {
    QuerySnapshot snapshot = await _db
        .collection('AdminDashboard')
        .where('date', isGreaterThanOrEqualTo: startDate)
        .where('date', isLessThanOrEqualTo: endDate)
        .orderBy('date', descending: false)
        .get();
    return snapshot.docs.map((doc) {
      return {
        'RecordId': doc.id,
        'UserId': doc['UserID'],
        'TotalPP': doc['TypePP'].toString(),
        'TotalPET': doc['TypePET'].toString(),
        'TotalHDPE': doc['TypeHDPE'].toString(),
        'TotalAllPlastic': doc['TotalAllPlastic'].toString(),
        'TotalEcoBakoPoints': doc['TotalEcoPoints'].toString(),
        'Date': doc['date'].toDate(), // Convert Firestore timestamp to DateTime
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> getDataUsersDashboard(
      ) async {
    QuerySnapshot snapshot = await _db
        .collection('UserDashboard')
        // .where('date', isGreaterThanOrEqualTo: startDate)
        // .where('date', isLessThanOrEqualTo: endDate)
        .get();
    return snapshot.docs.map((doc) {
      return {
        'UserId': doc.id,
        'TierLevel': doc['TierLevel'],
        'TotalPP': doc['TypePP'].toString(),
        'TotalPET': doc['TypePET'].toString(),
        'TotalHDPE': doc['TypeHDPE'].toString(),
        'TotalAllPlastic': doc['TotalAllPlastic'].toString(),
        'TotalEcoBakoPoints': doc['TotalEcoPoints'].toString(), // Convert Firestore timestamp to DateTime
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> getDataTransactions(
      DateTime startDate, DateTime endDate) async {
    QuerySnapshot snapshot = await _db
        .collection('Transactions')
        .where('date', isGreaterThanOrEqualTo: startDate)
        .where('date', isLessThanOrEqualTo: endDate)
        .orderBy('date', descending: false)
        .get();
    return snapshot.docs.map((doc) {
      return {
        'TransactionId': doc.id,
        'UserId': doc['userId'],
        'Type': doc['type'],
        'Description': doc['description'],
        'Amount': doc['amount'].toString(),
        'Date': doc['date'].toDate(), // Convert Firestore timestamp to DateTime
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> getDataProducts(
      ) async {
    QuerySnapshot snapshot = await _db
        .collection('Products')
        // .where('date', isGreaterThanOrEqualTo: startDate)
        // .where('date', isLessThanOrEqualTo: endDate)
        // .orderBy('date', descending: false)
        .get();
    return snapshot.docs.map((doc) {
      return {
        'ProductID': doc.id,
        'ProductName': doc['productName'],
        'Description': doc['Description'],
        'ProductPrice': doc['EcoPoint'].toString(), // Convert Firestore timestamp to DateTime
        'Stock': doc['Stock'].toString(), // Convert Firestore timestamp to DateTime
      };
    }).toList();
  }
}
