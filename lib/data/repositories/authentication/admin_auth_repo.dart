import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobako_app/admin_navigation_menu.dart';
import 'package:ecobako_app/features/authentication/screens/choose_role/choose_role.dart';
import 'package:ecobako_app/features/authentication/screens/login/login_admin/admin_login.dart';
import 'package:ecobako_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecobako_app/features/authentication/screens/signup/admin_signup/admin_verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AdminAuthenticationRepository extends GetxController {
  static AdminAuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Get authenticate user data
  User? get authUser => _auth.currentUser;

  // called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    adminScreenRedirect();
  }

  // Function to show relevent Screen
  // screenRedirect() async {
  //   final user = _auth.currentUser;
  //   if (user != null) {
  //     if (user.emailVerified) {
  //       print("I lalu screenRedirect function admin");
  //       print(user);
  //       Get.offAll(() => const AdminNavigationMenu());
  //       print("Admin successfully");
  //     } else {
  //       Get.offAll(() => AdminVerifyEmailScreen(email: _auth.currentUser?.email));
  //     }
  //   } else {
  //     deviceStorage.writeIfNull("isFirstTime", true);
  //     // check if the user is first time launching the app
  //     deviceStorage.read("isFirstTime") != true
  //         ? Get.offAll(
  //             () => const ChooseRole()) // redirect to choose role screen
  //         : Get.offAll(() =>
  //             const OnBoardingScreen()); // redirect to on boarding screen if the user is first time
  //   }
  //   // local storage
  // }

//   screenRedirect() async {
//   final user = _auth.currentUser;
//   if (user != null) {
//     if (user.emailVerified) {
//       // Get the user's role
//       final role = await getAdminRole(user.uid);
//       if (role == "admin") {
//         // User is an admin, redirect to admin navigation menu
//         Get.offAll(() => const AdminNavigationMenu());
//         print("Admin successfully");
//       } else {
//         // User is not an admin, redirect to ChooseRole page
//         Get.offAll(() => const ChooseRole());
//       }
//     } else {
//       // User email not verified, redirect to email verification screen
//       Get.offAll(() => AdminVerifyEmailScreen(email: _auth.currentUser?.email));
//     }
//   } else {
//     // User not logged in, handle first-time launch or other scenarios
//     deviceStorage.writeIfNull("isFirstTime", true);
//     deviceStorage.read("isFirstTime") != true
//         ? Get.offAll(() => const ChooseRole()) // Redirect to choose role screen
//         : Get.offAll(() => const OnBoardingScreen()); // Redirect to onboarding screen if user is first time
//   }
// }

// safest choice
// adminScreenRedirect() async {
//   final user = _auth.currentUser;
//   if (user != null) {
//     if (user.emailVerified) {
//      print("I lalu sini (adminScreenRedirect)");

//       // Get the user's role
//       final role = await getAdminRole(user.uid);
//       print("Role obtained: $role");

//       if (role == "admin") {
//         // If the role is admin, redirect to the AdminNavigationMenu
//         Get.offAll(() => const AdminNavigationMenu());
//       } else if (role == null || role.isEmpty) {
//         // If the role is null or empty, redirect to the ChooseRole page
//         print("Sebab xde role i lalu sini (admin)");
//         Get.offAll(() => const ChooseRole());
//       } else{
//         print("Sebab semua xde i lalu (admin)");
//         Get.offAll(() => const ChooseRole());
//       }
//       }
//   } else {
//     // User not logged in, handle first-time launch or other scenarios
//     deviceStorage.writeIfNull("isFirstTime", true);
//     deviceStorage.read("isFirstTime") != true
//         ? Get.offAll(() => const ChooseRole()) // Redirect to choose role screen
//         : Get.offAll(() => const OnBoardingScreen()); // Redirect to onboarding screen if user is first time
//   }
// }

Future<void> adminScreenRedirect() async {
  final user = _auth.currentUser;
  final box = GetStorage();
  final isAdminLoggedIn = box.read('admin_logged_in') ?? false; // Check login flag

  if (user != null) {
    if (user.emailVerified && isAdminLoggedIn) {
        // If the user did not log in using the adminEmailAndPasswordSignIn function, redirect to ChooseRole
        Get.offAll(() => const AdminNavigationMenu());
        return;
      } else if (user.emailVerified) {
        // If the user did not log in using the adminEmailAndPasswordSignIn function, redirect to ChooseRole
        Get.offAll(() => const ChooseRole());
        return;
      } 

    //   // Get the user's role
    //   final role = await getAdminRole(user.uid);
    //   print("Role obtained: $role");

    //   if (role == "admin") {
    //     // If the role is admin, redirect to the AdminNavigationMenu
    //     Get.offAll(() => const AdminNavigationMenu());
    //   } else {
    //     // If the role is null, empty, or not admin, redirect to the ChooseRole page
    //     print("Sebab xde role i lalu sini (admin)");
    //     Get.offAll(() => const ChooseRole());
    //   }
    else {
      // User email not verified, redirect to email verification screen
      Get.offAll(() => AdminVerifyEmailScreen(email: _auth.currentUser?.email));
    }
  } else {
    // User not logged in, handle first-time launch or other scenarios
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") != true
        ? Get.offAll(() => const ChooseRole()) // Redirect to choose role screen
        : Get.offAll(() => const OnBoardingScreen()); // Redirect to onboarding screen if user is first time
  }
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
      throw "Error - Wrong email or password";
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

    // check user role
  Future<String?> getAdminRole(String uid) async {
    try {
      // Get user document from Firestore
      final adminDoc = await FirebaseFirestore.instance.collection("Admins").doc(uid).get();

      // Check if user document exists
      if (adminDoc.exists) {
        // Get the role field from the user document
        final role = adminDoc.get("Role");

        // Check if role is not null or empty
        if (role != null && role.isNotEmpty) {
          return role;
        } else {
          // If role is null or empty, return null
          return null;
        }
      } else {
        // If user document doesn't exist, return null
        return null;
      }
    } catch (e) {
      // Handle errors
      return null;
    }
  }

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

  // LogoutUser - Valid for any authentication.
  Future<void> logout() async {
    try {
      // await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const AdminLoginScreen());
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
}
