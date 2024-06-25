// use and checked
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AdminDashboardRepository extends GetxController {
  static AdminDashboardRepository get instance => Get.find();
  

  final _db = FirebaseFirestore.instance;
  Future<void> addAdminDashboardData(String userId, double pp, double pet,
      double hdpe, int totalEcoPoints) async {
    final userDashboardRef = _db.collection('AdminDashboard');
    final String totalPlastic = (pp + pet + hdpe).toStringAsFixed(2);
    final String typePP = pp.toStringAsFixed(2);
    final String typePET = pet.toStringAsFixed(2);
    final String typeHDPE = hdpe.toStringAsFixed(2);

    try {
      await userDashboardRef.add({
        'TypePP': double.parse(typePP),
        'TypePET': double.parse(typePET),
        'TypeHDPE': double.parse(typeHDPE),
        'TotalEcoPoints': totalEcoPoints,
        'TotalAllPlastic': double.parse(totalPlastic),
        'UserID': userId,
        "date": Timestamp.now(),
      });
    } catch (e) {
      throw "Error adding data to AdminDashboardDatabase: $e";
    }
  }

  Future<List<Map<String, dynamic>>> getAdminDashboardData() async {
    try {
      // Fetch all documents in the AdminDashboard collection
      final querySnapshot = await _db.collection("AdminDashboard").get();

      // Extract and return data from each document
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } on FirebaseException catch (e) {
      print("FirebaseException - FADD: ${e.message}");
      throw Exception("Error1 - FADD ${e.message}");
    } on FormatException catch (e) {
      print("FormatException - FADD: ${e.message}");
      throw Exception("Error2 - FADD ${e.message}");
    } on PlatformException catch (e) {
      print("PlatformException - FADD: ${e.message}");
      throw Exception("Error3 - FADD ${e.message}");
    } catch (e) {
      print("Unknown Exception - FADD: ${e.toString()}");
      throw Exception("Something went wrong, Please try again - FADD");
    }
  }

  

Future<List<Map<String, dynamic>>> getAdminDashboardDataByDateFilter(
  [DateTime? selectedStartDate, DateTime? selectedEndDate]
) async {
  try {
    // make sure end date end with 23:59:59
    if (selectedEndDate != null) {
      selectedEndDate = DateTime(selectedEndDate.year, selectedEndDate.month, selectedEndDate.day, 23, 59, 59, 999);
    }
    // Query documents where the date field is between startDate and endDate
    
    final querySnapshot = await _db.collection("AdminDashboard")
        .where('date', isGreaterThanOrEqualTo: selectedStartDate)
        .where('date', isLessThanOrEqualTo: selectedEndDate)
        .get();

    // Extract and return data from each document
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  } on FirebaseException catch (e) {
    print("FirebaseException - FADD: ${e.message}");
    throw Exception("Error1 - FADD ${e.message}");
  } on FormatException catch (e) {
    print("FormatException - FADD: ${e.message}");
    throw Exception("Error2 - FADD ${e.message}");
  } on PlatformException catch (e) {
    print("PlatformException - FADD: ${e.message}");
    throw Exception("Error3 - FADD ${e.message}");
  } catch (e) {
    print("Unknown Exception - FADD: ${e.toString()}");
    throw Exception("Something went wrong, Please try again - FADD");
  }
}

  Future<Map<String, int>> fetchGenderStatistics() async {
    try {
      final querySnapshot = await _db.collection('Users').get();

      int maleCount = 0;
      int femaleCount = 0;

      // Iterate over each document in the query snapshot
      for (var doc in querySnapshot.docs) {
        final gender = doc['Gender'] ?? '';
        if (gender.toLowerCase() == 'male') {
          maleCount++;
        } else if (gender.toLowerCase() == 'female') {
          femaleCount++;
        }
      }

      return {
        'maleUsers': maleCount,
        'femaleUsers': femaleCount,
      };
    } catch (e) {
      return {
        'maleUsers': 0,
        'femaleUsers': 0,
      };
    }
  }
}

