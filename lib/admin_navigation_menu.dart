import 'package:ecobako_app/data/repositories/authentication/admin_auth_repo.dart';
import 'package:ecobako_app/features/dashboard/screens/admin/admin_dashboard.dart';
import 'package:ecobako_app/features/ecobako_point/ecopoint_allocation.dart';
import 'package:ecobako_app/features/home/screens/admin/admin_home.dart';
import 'package:ecobako_app/features/store/screens/admin/store/admin_store.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:ecobako_app/utils/popups/logout_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminNavigationMenu extends StatelessWidget {
  const AdminNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminNavigationController());
    final darkMode = BakoHelperFunctions.isDarkMode(context);

    return PopScope(
      canPop: false,
      onPopInvoked: ((didPop) async {
        if (didPop) {
          // If the user tries to navigate back from the Home screen
          return;
          }
          bool shouldLogout =
              await DialogUtils.showLogoutConfirmationDialog(context);
          if (shouldLogout) {
            AdminAuthenticationRepository.instance.logout();
          }
        }
      ),
      child: Scaffold(
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
      ),
    );
  }
}

class AdminNavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  // final screens = [const AdminHomeScreen(), const AdminStoreScreen(), AdminDashboardScreen(), const AdminPointAllocationScreen()];
  final screens = [ const AdminHomeScreen(), const AdminStoreScreen(), const AdminDashboardScreen(), const AdminPointAllocationScreen()];
}