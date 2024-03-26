import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BakoPrimaryHeaderContainer(
              child: Container() 
            ),
          ],
        ),
      ),
    );
  }
}
