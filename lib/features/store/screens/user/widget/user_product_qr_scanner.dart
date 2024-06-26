import 'dart:io';
import 'package:ecobako_app/features/store/screens/user/widget/user_redeem_item_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class UserProductQRScanner extends StatefulWidget {
  const UserProductQRScanner({Key? key}) : super(key: key);

  @override
  UserProductQRScannerState createState() => UserProductQRScannerState();
}

class UserProductQRScannerState extends State<UserProductQRScanner> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Center(
              child: Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Stop scanning and navigate to RedeemItemForm
      _navigateToRedeemItemForm(scanData.code);
    });
  }

  void _navigateToRedeemItemForm(String? qrCode) {
    controller.dispose(); // Dispose the controller to stop scanning
    Get.off(() => RedeemItemForm(), arguments: qrCode);
  }

  @override
  void dispose() {
    controller.dispose(); // Dispose the controller in the dispose method
    super.dispose();
  }
}

