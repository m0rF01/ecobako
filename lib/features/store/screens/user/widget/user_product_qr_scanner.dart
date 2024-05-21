import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';

class UserProductQRScanner extends StatefulWidget {
  const UserProductQRScanner({super.key});

  @override
  UserProductQRScannerState createState() => UserProductQRScannerState();
}

class UserProductQRScannerState extends State<UserProductQRScanner> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
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
      // Handle scanned QR code data
      // print('Scanned data: ${scanData.code}');
      // Update the form with the scanned data
      // Get.back(result: scanData.code);
     Navigator.pop(context, scanData.code);
        // setState(() {
        //         result = scanData;
        //         _productIdController.text = scanData.code ??"";
        //         Navigator.pop(context);
        //       });
      
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

// import 'package:ecobako_app/features/store/screens/user/product_details/user_product_redeem_summary.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class RedeemItemForm extends StatefulWidget {
//   const RedeemItemForm({super.key});

//   @override
//   RedeemItemFormState createState() => RedeemItemFormState();
// }

// class RedeemItemFormState extends State<RedeemItemForm> {
//   final _formKey = GlobalKey<FormState>();
//   String _productId = '';
//   int _quantity = 1;
//   final TextEditingController _productIdController = TextEditingController();
//   final TextEditingController _quantityController = TextEditingController();
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   Barcode? result;
//   QRViewController? controller;

//   void _scanQRCode() async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => QRViewExample(
//           onQRViewCreated: (controller) {
//             this.controller = controller;
//             controller.scannedDataStream.listen((scanData) {
//               setState(() {
//                 result = scanData;
//                 _productIdController.text = scanData.code ??"";
//                 Navigator.pop(context);
//               });
//             });
//           },
//         ),
//       ),
//     );
//   }

//   void _validateAndProceed() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       _formKey.currentState?.save();
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => SummaryPage(
//             productId: _productId,
//             quantity: _quantity,
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Redeem Item'),
//       content: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               controller: _productIdController,
//               decoration: const InputDecoration(labelText: 'Product ID'),
//               validator: (value) {
//                 if (value?.isEmpty ?? true) {
//                   return 'Please enter a product ID';
//                 }
//                 return null;
//               },
//               onSaved: (value) => _productId = value ?? '',
//             ),
//             TextFormField(
//               controller: _quantityController,
//               decoration: const InputDecoration(labelText: 'Quantity'),
//               keyboardType: TextInputType.number,
//               validator: (value) {
//                 final quantity = int.tryParse(value ?? '');
//                 if (quantity == null || quantity <= 0) {
//                   return 'Please enter a valid quantity';
//                 }
//                 return null;
//               },
//               onSaved: (value) => _quantity = int.parse(value ?? '1'),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton.icon(
//               onPressed: _scanQRCode,
//               icon: const Icon(Icons.qr_code_scanner),
//               label: const Text('Scan QR Code'),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _validateAndProceed,
//               child: const Text('Next'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class QRViewExample extends StatelessWidget {
//   final Function(QRViewController) onQRViewCreated;

//   const QRViewExample({super.key, required this.onQRViewCreated});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Scan QR Code')),
//       body: QRView(
//         key: GlobalKey(debugLabel: 'QR'),
//         onQRViewCreated: onQRViewCreated,
//       ),
//     );
//   }
// }

