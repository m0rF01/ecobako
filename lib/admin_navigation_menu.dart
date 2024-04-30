import 'package:ecobako_app/features/ecobako_point/ecopoint_allocation.dart';
import 'package:ecobako_app/features/home/screens/admin/admin_home.dart';
import 'package:ecobako_app/features/store/screens/admin/store/admin_store.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminNavigationMenu extends StatelessWidget {
  const AdminNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminNavigationController());
    final darkMode = BakoHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? BakoColors.black : Colors.white,
          indicatorColor: darkMode ? BakoColors.white.withOpacity(0.1) : BakoColors.black.withOpacity(0.1),
        
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.status_up), label: "Analytics"),
            NavigationDestination(icon: Icon(Iconsax.receipt_add), label: "Allocate"),
          ],
        ),
      ),

      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class AdminNavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const AdminHomeScreen(), const AdminStoreScreen(), Container(color: Colors.orange,), const AdminPointAllocationScreen()];
}