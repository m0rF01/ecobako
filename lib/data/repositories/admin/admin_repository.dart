import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobako_app/data/repositories/authentication/admin_auth_repo.dart';
import 'package:ecobako_app/features/personalization/models/admin_modal.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminRepository extends GetxController {
  static AdminRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // //fx to save user data to firestore
  // Future<void> saveUserRecord(UserModel user) async {
  //   try{
  //     await _db.collection("Users").doc(user.id).set(user.toJson());
  //   } on FirebaseException catch (e) {
  //     throw BakoFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const BakoFormatExecption();
  //   } on PlatformException catch (e){
  //     throw BakoPlatformException(e.code).message;
  //   } catch (e) {
  //     throw "Something went wrong, Please try again";
  //   }
  // }
  //fx to save user data to firestore

  // Function to save user data to firestore
  Future<void> saveAdminRecord(AdminModel admin) async {
    try {
      await _db.collection("Admins").doc(admin.id).set(admin.toJson());
    } on FirebaseException catch (e) {
      throw "Error1 - SUR ${e.message}";
    } on FormatException catch (e) {
      throw "Error2 - SUR ${e.message}";
    } on PlatformException catch (e) {
      throw "Error3 - SUR ${e.message}";
    } catch (e) {
      throw "Something went wrong, Please try again - UR";
    }
  }

  // Function to fetch user details based on user ID
  Future<AdminModel> fetchAdminDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Admins")
          .doc(AdminAuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return AdminModel.fromSnapshot(documentSnapshot);
      } else {
        return AdminModel.empty();
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

  // Function to update user data in Firestore
  Future<void> updateAdminDetails(AdminModel updatedAdmin) async {
    try {
      await _db
          .collection("Admins")
          .doc(updatedAdmin.id)
          .update(updatedAdmin.toJson());
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

  // Update any field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Admins")
          .doc(AdminAuthenticationRepository.instance.authUser?.uid)
          .update(json);
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

  // Function to remove user data from Firestore
  Future<void> removeAdminRecord(String adminID) async {
    try {
      await _db.collection("Admins").doc(adminID).delete();
    } on FirebaseException catch (e) {
      throw "Error1 - RUR ${e.message}";
    } on FormatException catch (e) {
      throw "Error2 - RUR ${e.message}";
    } on PlatformException catch (e) {
      throw "Error3 - RUR ${e.message}";
    } catch (e) {
      throw "Something went wrong, Please try again - UR";
    }
  }

  // Upload any Image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw "Error1 - UI ${e.message}";
    } on FormatException catch (e) {
      throw "Error2 - UI ${e.message}";
    } on PlatformException catch (e) {
      throw "Error3 - UI ${e.message}";
    } catch (e) {
      throw "Something went wrong, Please try again - UI";
    }
  }

  //  Future<String> uploadStoreItemImage(String path, XFile image) async {
  //   try {
  //     final ref = FirebaseStorage.instance.ref(path).child(image.name);
  //     await ref.putFile(File(image.path));
  //     final url = await ref.getDownloadURL();
  //     return url;
  //   } on FirebaseException catch (e) {
  //     throw "Error1 - UI ${e.message}";
  //   } on FormatException catch (e) {
  //     throw "Error2 - UI ${e.message}";
  //   } on PlatformException catch (e) {
  //     throw "Error3 - UI ${e.message}";
  //   } catch (e) {
  //     throw "Something went wrong, Please try again - UI";
  //   }
  // }
}
