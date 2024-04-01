import 'package:ecobako_app/features/personalization/screens/settings/settings.dart';
import 'package:ecobako_app/features/module/screens/home/user/home.dart';
import 'package:ecobako_app/features/module/screens/module/screen/user_module.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserNavigationMenu extends StatelessWidget {
  const UserNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
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
            NavigationDestination(icon: Icon(Iconsax.teacher), label: "Module"),
            NavigationDestination(icon: Icon(Iconsax.status_up), label: "Analytics"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),

      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const UserHomeScreen(), const UserModuleScreen(), Container(color: Colors.orange,), const UserSettingScreen()];
}