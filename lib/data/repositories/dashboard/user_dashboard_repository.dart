// use and checked
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobako_app/features/dashboard/models/user_dashboard_model.dart';
import 'package:ecobako_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecobako_app/utils/exceptions/format_exceptions.dart';
import 'package:ecobako_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserDashboardRepository extends GetxController {
  static UserDashboardRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> updateUserDashboardData(String userId, double pp, double pet,
      double hdpe, int totalEcoPoints) async {
    final userDashboardRef = _db.collection('UserDashboard').doc(userId);
    final userDashboardSnapshot = await userDashboardRef.get();
    final String totalPlastic = (pp + pet + hdpe).toStringAsFixed(2);
    final String typePP = pp.toStringAsFixed(2);
    final String typePET = pet.toStringAsFixed(2);
    final String typeHDPE = hdpe.toStringAsFixed(2);

    if (userDashboardSnapshot.exists) {
      await userDashboardRef.update({
        'TypePP': FieldValue.increment(double.parse(typePP)),
        'TypePET': FieldValue.increment(double.parse(typePET)),
        'TypeHDPE': FieldValue.increment(double.parse(typeHDPE)),
        'TotalEcoPoints': FieldValue.increment(totalEcoPoints),
        'TotalAllPlastic': FieldValue.increment(double.parse(totalPlastic))
      });
    } else {
      await userDashboardRef.set({
        'TypePP': pp,
        'TypePET': pet,
        'TypeHDPE': hdpe,
        'TotalEcoPoints': totalEcoPoints,
        'TotalAllPlastic': pp + pet + hdpe,
        'TierLevel': 'Newbie', // default tier level
      });
    }
    // Call updateTier after updating the dashboard data
    final userDashboardSnapshotUpdated = await userDashboardRef.get();
    if (userDashboardSnapshotUpdated.exists) {
      final UserDashboardModel dashboardModel =
          UserDashboardModel.fromSnapshot(userDashboardSnapshotUpdated);
      dashboardModel.updateTier();
      await userDashboardRef.update({'TierLevel': dashboardModel.tierLevel});
    }
  }

  Future<UserDashboardModel> fetchUserDashboardData(String userId) async {
    try {
      print("Print from repo $userId");
      final documentSnapshot =
          await _db.collection("UserDashboard").doc(userId).get();
      if (documentSnapshot.exists) {
        print(UserDashboardModel.fromSnapshot(documentSnapshot));
        return UserDashboardModel.fromSnapshot(documentSnapshot);
      } else {
        return UserDashboardModel.empty();
      }
    } on FirebaseException catch (e) {
      throw BakoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BakoFormatException();
    } on PlatformException catch (e) {
      throw BakoPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
  
  Future<void> setDefaultDashboardValues(String userId) async {
  final userDashboardRef = FirebaseFirestore.instance.collection('UserDashboard').doc(userId);
  final userDashboardSnapshot = await userDashboardRef.get();

  // Set default values only if the document does not exist
  if (!userDashboardSnapshot.exists) {
    await userDashboardRef.set({
      'TypePP': 0.00,
      'TypePET': 0.00,
      'TypeHDPE': 0.00,
      'TotalEcoPoints': 0,
      'TotalAllPlastic': 0.0,
      'TierLevel': 'Newbie', // default tier level
    });
  }
}

}
