import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/features/home/screens/admin/widgets/admin_home_appbar.dart';
import 'package:ecobako_app/features/module/screens/admin/admin_module.dart';
import 'package:ecobako_app/features/personalization/controllers/admin_controller.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AdminController.instance;
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BakoPrimaryHeaderContainer(
              child: Column(
              children: [
                BakoAdminHomeAppBar(),
                SizedBox(height: BakoSizes.spaceBtwSections,)
              ],
             )
            ),

            //body
            AdminModule()
          ],
        ),
      ),
    );
  }
}

