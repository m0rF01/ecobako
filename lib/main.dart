import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ecobako_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecobako_app/firebase_options.dart';
import 'package:ecobako_app/data/repositories/authentication/authentication_repository.dart';

Future<void> main() async{

  // Todo: Add Widgets Bindings
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init Local Storage
  await GetStorage.init();

  // Todo: Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Initialize Firebase & Authentication
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,).then(
  (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(const App());
}
