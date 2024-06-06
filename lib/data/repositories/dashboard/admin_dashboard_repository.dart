import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobako_app/features/dashboard/models/admin_dashboard_models.dart';
import 'package:get/get.dart';

class AdminDashboardRepository extends GetxController {
  static AdminDashboardRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  Future<void> addAdminDashboardData(String userId, double pp, double pet,
      double hdpe, int totalEcoPoints) async {
    final userDashboardRef = _db.collection('AdminDashboard');
    // final userDashboardSnapshot = await userDashboardRef.get();
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
  }