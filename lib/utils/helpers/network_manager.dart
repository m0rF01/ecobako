// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:ecobako_app/common/widget/loaders/loaders.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class NetworkManager extends GetxController{
//   static NetworkManager get instance => Get.find();

//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

//   @override
//   void onInit(){
//     super.onInit();
//     _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     _connectionStatus.value = result;
//     if (_connectionStatus.value == ConnectivityResult.none) {
//       BakoLoaders.warningSnackBar(title: "No internet connection");
//     }
//   }

//   Future<bool> isConnected() async{
//     try{
//       final result = await _connectivity.checkConnectivity();
//       if (result == ConnectivityResult.none) {
//         return false;
//       } else{
//         return true;
//       }
//     } on PlatformException catch (_) {
//       return false;
//     }
//   }

//   @override
//   void onClose(){
//     super.onClose();
//     _connectivitySubscription.cancel();
//   }
// }

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _updateConnectionStatus(
          result.isNotEmpty ? result.first : ConnectivityResult.none);
    });
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      BakoLoaders.warningSnackBar(
          title: "No internet connection",
          message: "Please check your internet connection and try again");
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
