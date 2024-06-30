// use and checked
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobako_app/data/repositories/authentication/admin_auth_repo.dart';
import 'package:ecobako_app/features/personalization/models/admin_modal.dart';
import 'package:ecobako_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecobako_app/utils/exceptions/format_exceptions.dart';
import 'package:ecobako_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminRepository extends GetxController {
  static AdminRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to firestore
  Future<void> saveAdminRecord(AdminModel admin) async {
    try {
      await _db.collection("Admins").doc(admin.id).set(admin.toJson());
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
      throw BakoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BakoFormatException();
    } on PlatformException catch (e) {
      throw BakoPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
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
      throw BakoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BakoFormatException();
    } on PlatformException catch (e) {
      throw BakoPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  // Update any field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Admins")
          .doc(AdminAuthenticationRepository.instance.authUser?.uid)
          .update(json);
    }on FirebaseException catch (e) {
      throw BakoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BakoFormatException();
    } on PlatformException catch (e) {
      throw BakoPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  // Function to remove user data from Firestore
  Future<void> removeAdminRecord(String adminID) async {
    try {
      await _db.collection("Admins").doc(adminID).delete();
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

  // Upload any Image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }on FirebaseException catch (e) {
      throw BakoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BakoFormatException();
    } on PlatformException catch (e) {
      throw BakoPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
