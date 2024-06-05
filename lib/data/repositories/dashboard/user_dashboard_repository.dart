import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobako_app/features/dashboard/models/user_dashboard_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserDashboardRepository extends GetxController {
  static UserDashboardRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> updateUserDashboardData(String userId, double pp, double pet, double hdpe, int totalEcoPoints) async {
    final userDashboardRef = _db.collection('UserDashboard').doc(userId);
    final userDashboardSnapshot = await userDashboardRef.get();

    if (userDashboardSnapshot.exists) {
      await userDashboardRef.update({
        'TypePP': FieldValue.increment(pp),
        'TypePET': FieldValue.increment(pet),
        'TypeHDPE': FieldValue.increment(hdpe),
        'TotalEcoPoints': FieldValue.increment(totalEcoPoints),
        'TotalAllPlastic': FieldValue.increment(pp + pet + hdpe),
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
  }

 Future<UserDashboardModel> fetchUserDashboardData(String userId) async {
    try {
      print("Print from repo $userId");
      final documentSnapshot = await _db
          .collection("UserDashboard")
          .doc(userId)
          .get();
      if (documentSnapshot.exists) {
        print(UserDashboardModel.fromSnapshot(documentSnapshot));
        return UserDashboardModel.fromSnapshot(documentSnapshot);
      } else {
        return UserDashboardModel.empty();
      }
    } on FirebaseException catch (e) {
      throw "Error1 - FUD ${e.message}";
    } on FormatException catch (e) {
      throw "Error2 - FUD ${e.message}";
    } on PlatformException catch (e) {
      throw "Error3 - FUD ${e.message}";
    } catch (e) {
      throw "Something went wrong, Please try again - UR";
    }
  }


}
