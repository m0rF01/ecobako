import 'package:cloud_firestore/cloud_firestore.dart';

class UserDashboardModel {
  String id;
  double pp;
  double pet;
  double hdpe;
  int totalEcoPoints;
  double totalAllPlastic;
  String tierLevel;

  UserDashboardModel({
    required this.id,
    required this.pp,
    required this.pet,
    required this.hdpe,
    required this.totalEcoPoints,
    required this.totalAllPlastic,
    required this.tierLevel,
  });

  static UserDashboardModel empty() => UserDashboardModel(
      id: '',
      pp: 0.0,
      pet: 0.0,
      hdpe: 0.0,
      totalEcoPoints: 0,
      totalAllPlastic: 0.0, 
      tierLevel: '');

  toJson() {
    return {
      "UserID": id,
      "TypePP": pp,
      "TypePET": pet,
      "TypeHDPE": hdpe,
      "TotalEcoPoints": totalEcoPoints,
      "TotalAllPlastic": totalAllPlastic,
      "TierLevel": tierLevel,
    };
  }

  factory UserDashboardModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return UserDashboardModel.empty();
    final data = document.data()!;
    return UserDashboardModel(
      id: document.id,
      pp: data["TypePP"],
      pet: data["TypePET"],
      hdpe: data["TypeHDPE"],
      totalEcoPoints: data["TotalEcoPoints"],
      totalAllPlastic: data["TotalAllPlastic"], 
      tierLevel: data["TierLevel"],
    );
  }
}
