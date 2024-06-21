import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/features/store/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductQrCode extends StatelessWidget {

  final ProductModel product;
  const ProductQrCode({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        appBar: const BakoAppBar(
          showBackArrow: true,
          title: Text("Item QR Code"),
        ),
          body: Center(
        child: product.productQR.isNotEmpty
            ? Image.network(product.productQR)
            : const Text('No QR Code available'),
      ),
      ),
    );
  }
}
