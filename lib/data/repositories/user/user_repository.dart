import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobako_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecobako_app/features/personalization/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

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
  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e){
      throw "Error1 - SUR ${e.message}";
    } on FormatException catch (e) {
      throw "Error2 - SUR ${e.message}";
    } on PlatformException catch (e){
      throw "Error3 - SUR ${e.message}";
    } catch (e) {
      throw "Something went wrong, Please try again - UR";
    }
  }

  // Function to fetch user details based on user ID
 Future<UserModel> fetchUserDetails() async {
    try{
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e){
      throw "Error1 - FUD ${e.message}";
    } on FormatException catch (e) {
      throw "Error2 - FUD ${e.message}";
    } on PlatformException catch (e){
      throw "Error3 - FUD ${e.message}";
    } catch (e) {
      throw "Something went wrong, Please try again - UR";
    }
  }

  // Function to update user data in Firestore
   Future<void> updateUserDetails(UserModel updatedUser) async {
    try{
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch (e){
      throw "Error1 - FUD ${e.message}";
    } on FormatException catch (e) {
      throw "Error2 - FUD ${e.message}";
    } on PlatformException catch (e){
      throw "Error3 - FUD ${e.message}";
    } catch (e) {
      throw "Something went wrong, Please try again - UR";
    }
  }

  // Update any field in specific user collection
     Future<void> updateSingleField(Map<String, dynamic> json) async {
    try{
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e){
      throw "Error1 - FUD ${e.message}";
    } on FormatException catch (e) {
      throw "Error2 - FUD ${e.message}";
    } on PlatformException catch (e){
      throw "Error3 - FUD ${e.message}";
    } catch (e) {
      throw "Something went wrong, Please try again - UR";
    }
  }

  // Function to remove user data from Firestore
       Future<void> removeUserRecord(String userID) async {
    try{
      await _db.collection("Users").doc(userID).delete();
    } on FirebaseException catch (e){
      throw "Error1 - RUR ${e.message}";
    } on FormatException catch (e) {
      throw "Error2 - RUR ${e.message}";
    } on PlatformException catch (e){
      throw "Error3 - RUR ${e.message}";
    } catch (e) {
      throw "Something went wrong, Please try again - UR";
    }
  }

  // Upload any Image
  
}