import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  final String id;
  final String adminID;
 

  AdminModel({
    required this.id, 
    required this.adminID
  });


  // static function to create an empty user model
  static AdminModel empty() => AdminModel(
    id: "",
    adminID: "",
  );


  // convert model to JSON structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      "ID": adminID,
    };
  }

  // factory method to create a UserModel from a firebase document snapshot

  factory AdminModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null){
      final data = document.data()!;
      return AdminModel (
        id: document.id,
        adminID: data["AdminID"] ?? "",
      );
    } else {
      throw Exception("Document data is null");
    }
  }
}