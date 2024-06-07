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
}
