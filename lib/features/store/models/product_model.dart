import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String productName;
  String imageProduct;
  int point;
  String productDescription;
  int stock;
  String imageQr;

  ProductModel({
    required this.id,
    required this.productName,
    required this.imageProduct,
    required this.point,
    required this.productDescription,
    required this.stock,
    required this.imageQr,
  });

  // Empty funct for clean code
  static ProductModel empty() => ProductModel(
        id: "",
        productName: "",
        imageProduct: "",
        point: 0,
        productDescription: "",
        stock: 0,
        imageQr: "",
      );

  // Json Format
  toJson() {
    return {
      "ProductName": productName,
      "Image": imageProduct,
      "EkoPoint": point,
      "Description": productDescription,
      "Stock": stock,
      "Qr": imageQr,
    };
  }

  // Map Json oriented document snapshot from Firebase to Model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
        id: document.id,
        productName: data["productName"],
        imageProduct: data["imageProduct"],
        // point: int.parse((data["point"] ?? 0).toString()),
        point: data["point"] ?? 0,
        productDescription: data["productDescription"],
        stock: data["stock"] ?? 0,
        imageQr: data["imageQr"]);
  }

 
}
