import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserQrCode extends StatelessWidget {
  const UserQrCode({super.key}); 

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return  Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        appBar: const BakoAppBar(
          showBackArrow: true,
          title: Text("User QR Code"),
        ),
        body: Center(
          child: Obx(()  {
            final userQR = controller.user.value.userQR;
            return userQR.isEmpty
                ? const CircularProgressIndicator() // Placeholder while loading
                : Image.network(userQR); // Display QR code image
          }),
          ),
      ),
    );
  }
}