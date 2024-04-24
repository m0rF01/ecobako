import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobako_app/features/personalization/models/admin_modal.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AdminRepository extends GetxController{
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
  Future<void> saveUserRecord(AdminModel admin) async {
    try{
      await _db.collection("Admins").doc(admin.id).set(admin.toJson());
    } on FirebaseException catch (_){
      throw "Error1 - UR";
    } on FormatException catch (_) {
      throw "Error2 - UR";
    } on PlatformException catch (_){
      throw "Error3 - UR";
    } catch (e) {
      throw "Something went wrong, Please try again - UR";
    }
  }
  
}