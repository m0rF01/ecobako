import 'package:ecobako_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecobako_app/features/dashboard/screens/user/user_dashboard.dart';
import 'package:ecobako_app/features/personalization/screens/settings/settings.dart';
import 'package:ecobako_app/features/home/screens/user/home.dart';
import 'package:ecobako_app/features/module/screens/user/user_module.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:ecobako_app/utils/popups/logout_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserNavigationMenu extends StatelessWidget {
  const UserNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserNavigationController());
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
          AuthenticationRepository.instance.logout();
        }
      }),
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: darkMode ? BakoColors.black : Colors.white,
            indicatorColor: darkMode
                ? BakoColors.white.withOpacity(0.1)
                : BakoColors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(
                  icon: Icon(Iconsax.teacher), label: "Module"),
              NavigationDestination(
                  icon: Icon(Iconsax.status_up), label: "Analytics"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}

class UserNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const UserHomeScreen(),
    UserModuleScreen(),
    const UserDashboardScreen(),
    const UserSettingScreen()
  ];
}

