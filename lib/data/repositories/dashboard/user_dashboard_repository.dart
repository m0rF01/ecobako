// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecobako_app/features/dashboard/models/user_dashboard_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class UserDashbaordRepository extends GetxController {
//   static UserDashbaordRepository get instance => Get.find();

//   final _db = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<Map<String, dynamic>> getUserDashboardData(String userId) async {
//     try {
//       final DocumentSnapshot userDashboardData =
//           await _db.collection('UserDashboard').doc(userId).get();
//       if (!userDashboardData.exists) {
//         return {}; // User data noy found
//       }
//       return userDashboardData.data() as Map<String, dynamic>;
//     } catch (e) {
//       return {};
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
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
}
