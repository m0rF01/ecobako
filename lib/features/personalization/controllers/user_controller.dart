import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/data/repositories/user/user_repository.dart';
import 'package:ecobako_app/features/personalization/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  Future<void> saveUserRecord(UserCredential? userCredentials) async{
    try {
      if (userCredentials != null) {
        // Converts name to first name and last name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? "");
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? "");

        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid, 
          firstName: nameParts[0], 
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join("") : "",
          username: username,
          homeAddress: "",
          postal: "",
          country: "",
          gender: "",
          age: "",
          email: userCredentials.user!.email ?? "",
          phoneNo: userCredentials.user!.phoneNumber ?? "",
          profilePicture: userCredentials.user!.photoURL??"",
        );

        // save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      BakoLoaders.warningSnackBar(title: "Data not saved", message: "Something went wrong while saving your information. Ypu can resave your data in your Profile.");
    }
  }
}