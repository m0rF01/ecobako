import 'package:ecobako_app/features/authentication/screens/choose_role/choose_role.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_user/login.dart';
import 'package:ecobako_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecobako_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecobako_app/user_navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  // Function to show relevent Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const UserNavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull("isFirstTime", true);
      // check if the user is first time launching the app
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(
              () => const ChooseRole()) // redirect to choose role screen
          : Get.offAll(() =>
              const OnBoardingScreen()); // redirect to on boarding screen if the user is first time
    }
    // local storage
  }

  /*-------------------------------- Email & Password sign-in -------------------------------*/

  /// Email auth - sign in
  ///
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (_) {
      throw "Error1 - AR";
    } on FirebaseException catch (_) {
      throw "Error 2 - AR";
    } on FormatException catch (_) {
      throw "Error 3 - AR";
    } on PlatformException catch (_) {
      throw "Error 4 - AR";
    } catch (e) {
      throw "Something went wrong, Please try again - AR";
    }
  }

  /// Email auth - registration
  // Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
  //   try{
  //     return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw BakoFirebaseAuthException(e.code).message;
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

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (_) {
      throw "Error1 - AR";
    } on FirebaseException catch (_) {
      throw "Error 2 - AR";
    } on FormatException catch (_) {
      throw "Error 3 - AR";
    } on PlatformException catch (_) {
      throw "Error 4 - AR";
    } catch (e) {
      throw "Something went wrong, Please try again - AR";
    }
  }

  /// reauth - reauth user

  /// emailVerification - email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (_) {
      throw "Error1 - EV";
    } on FirebaseException catch (_) {
      throw "Error 2 - EV";
    } on FormatException catch (_) {
      throw "Error 3 - EV";
    } on PlatformException catch (_) {
      throw "Error 4 - EV";
    } catch (e) {
      throw "Something went wrong, Please try again - ";
    }
  }

  /// emailAuthentication - forgot password
    Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw "Error1 - RP ${e.message}";
    } on FirebaseException catch (e) {
      throw "Error 2 - RP ${e.message}";
    } on FormatException catch (e) {
      throw "Error 3 - RP ${e.message}";
    } on PlatformException catch (_) {
      throw "Error 4 - RP";
    } catch (e) {
      throw "Something went wrong, Please try again - ";
    }
  }

  /*-------------------------------- Federated identity & social sign in -------------------------------*/

  // GoogleAuth - Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // trigger the auth flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return user credentials
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw "Error1 - GA ${e.message}";
    } on FirebaseException catch (e) {
      throw "Error 2 - GA ${e.message}";
    } on FormatException catch (e) {
      throw "Error 3 - GA ${e.message}";
    } on PlatformException catch (_) {
      throw "Error 4 - GA";
    } catch (e) {
      throw "Something went wrong, Please try again - GA ";
    }
  }

  // FacebookAuth - Facebook

  /*-------------------------------- End Federated identity & social sign in -------------------------------*/

  // LogoutUser - Valid for any authentication.
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (_) {
      throw "Error1 - EV";
    } on FirebaseException catch (_) {
      throw "Error 2 - EV";
    } on FormatException catch (_) {
      throw "Error 3 - EV";
    } on PlatformException catch (_) {
      throw "Error 4 - EV";
    } catch (e) {
      throw "Something went wrong, Please try again - ";
    }
  }

  // DeleteUser - Remove user Auth and Firestore Account
}
