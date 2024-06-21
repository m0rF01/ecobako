import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobako_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecobako_app/features/personalization/models/user_model.dart';
import 'package:ecobako_app/features/transaction/model/transaction_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

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
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
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
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
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
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
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
  Future<void> removeUserRecord(String userID) async {
    try {
      await _db.collection("Users").doc(userID).delete();
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

// Getting the user's current EcoBako point from database
  Future<int> fetchUserEcoPoints(String userid) async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(userid).get();
      if (documentSnapshot.exists) {
        final userData = documentSnapshot.data();
        if (userData != null && userData.containsKey('EcoPoint')) {
          final ecoPoints = userData['EcoPoint'] as int?;
          if (ecoPoints != null) {
            return ecoPoints;
          }
        }
      }
      return 0;
    } catch (e) {
      throw "Error fetching user EcoPoint: $e";
    }
  }

// Updating the new EcoBako point after claiming point
  Future<void> updateUserEcoPoints(String userid, int newPoints) async {
    try {
      final documentReference = _db.collection("Users").doc(userid);
      // Convert newPoints to String
      // String ecoPointsAsString = newPoints.toString();
      // Update EcoPoint field with the converted value
      // await documentReference.update({'EcoPoint': ecoPointsAsString});
      await documentReference.update({'EcoPoint': newPoints});
    } catch (e) {
      throw "Error updating user EcoPoint: $e";
    }
  }

// Function to check if the user already has a qr code id or not
  Future<bool> checkUserQR(String userId) async {
    try {
      final docSnapshot = await _db.collection('Users').doc(userId).get();
      final userQR = docSnapshot.data()?['UserQR'];
      return userQR == null || userQR.isEmpty;
    } catch (e) {
      return true; // Assume QR is empty if an error occurs
    }
  }

// Generate User qr code, render in image format and save in database
  Future<String> generateAndSaveQRCode(String userId) async {
    try {
      // Generate QR code
      final qrData = userId;
      final qrPainter = QrPainter(
        data: qrData,
        version: QrVersions.auto,
        gapless: true,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: Color(0xFF000000),
        ),
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: Color(0xFF000000),
        ),
      );

      // Convert QR image to bytes
      final picData = await qrPainter.toImageData(200);
      final imageData = picData!.buffer.asUint8List();

      // Upload QR code image to Firebase Storage
      final storageRef =
          _storage.ref().child('Users/Images/qr_codes/$userId.png');
      await storageRef.putData(imageData);

      // Get download URL of the uploaded QR code image
      final downloadUrl = await storageRef.getDownloadURL();

      // Update UserQR field in Firestore with the download URL
      await _db.collection('Users').doc(userId).update({
        'UserQR': downloadUrl,
      });

      return downloadUrl;
    } catch (e) {
      rethrow;
    }
  }

// fetch transaction history data
  Future<List<TransactionModel>> fetchTransactions(String userId) async {
    try {
      final querySnapshot = await _db
          .collection('Transactions')
          .where('userId', isEqualTo: userId)
          .orderBy('date', descending: true)
          .limit(5)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs
            .map((doc) => TransactionModel.fromSnapshot(doc))
            .toList();
      } else {
        print("No data found");
        return [];
      }
    } on FirebaseException catch (e) {
      throw "Error1 - FT ${e.message}";
    } on FormatException catch (e) {
      throw "Error2 - FT ${e.message}";
    } on PlatformException catch (e) {
      throw "Error3 - FT ${e.message}";
    } catch (e) {
      throw "Something went wrong, Please try again - FT";
    }
  }

  Future<List<TransactionModel>> fetchDetailsTransactions(String userId,
      [DateTime? startDate, DateTime? endDate]) async {
    try {
      Query query = _db
          .collection('Transactions')
          .where('userId', isEqualTo: userId)
          .orderBy('date', descending: true);

      if (startDate != null && endDate != null) {
        // Set endDate to the end of the day
        endDate =
            DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59, 999);
        query = query
            .where('date', isGreaterThanOrEqualTo: startDate)
            .where('date', isLessThanOrEqualTo: endDate);
      }

      final querySnapshot = await query.get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs
            .map((doc) => TransactionModel.fromSnapshot(
                doc as QueryDocumentSnapshot<Map<String, dynamic>>))
            .toList();
      } else {
        return [];
      }
    } on FirebaseException catch (e) {
      throw "Error1 - FDT ${e.message}";
    } on FormatException catch (e) {
      throw "Error2 - FDT ${e.message}";
    } on PlatformException catch (e) {
      throw "Error3 - FDT ${e.message}";
    } catch (e) {
      throw "Something went wrong, Please try again - FDT";
    }
  }
}
