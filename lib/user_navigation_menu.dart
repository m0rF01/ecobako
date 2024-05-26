import 'package:ecobako_app/data/repositories/authentication/authentication_repository.dart';
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

    return 
    PopScope(
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
        }
      ),
      child: 
      Scaffold(
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
    const UserModuleScreen(),
    Container(
      color: Colors.orange,
    ),
    const UserSettingScreen()
  ];
}

// import 'package:ecobako_app/features/personalization/screens/settings/settings.dart';
// import 'package:ecobako_app/features/home/screens/user/home.dart';
// import 'package:ecobako_app/features/module/screens/user/user_module.dart';
// import 'package:ecobako_app/utils/constants/colors.dart';
// import 'package:ecobako_app/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class UserNavigationMenu extends StatelessWidget {
//   const UserNavigationMenu({super.key,});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(UserNavigationController());
//     final darkMode = BakoHelperFunctions.isDarkMode(context);

//     return PopScope(
//       onPopInvoked: (finality) async {
//         // Check if the current screen is a root screen
//         final isRoot =
//             controller.rootPages.contains(controller.selectedIndex.value);
//         if (isRoot) {
//           final shouldLogout = await _showLogoutDialog(context);
//           if (shouldLogout ?? false) {
//             return;
//           } else {
//             throw 'Navigation canceled'; // Throw an error to cancel the navigation
//           }
//         }
//       },
//       child: Scaffold(
//         bottomNavigationBar: Obx(
//           () => NavigationBar(
//             height: 80,
//             elevation: 0,
//             selectedIndex: controller.selectedIndex.value,
//             onDestinationSelected: (index) =>
//                 controller.selectedIndex.value = index,
//             backgroundColor: darkMode ? BakoColors.black : Colors.white,
//             indicatorColor: darkMode
//                 ? BakoColors.white.withOpacity(0.1)
//                 : BakoColors.black.withOpacity(0.1),
//             destinations: const [
//               NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
//               NavigationDestination(
//                   icon: Icon(Iconsax.teacher), label: "Module"),
//               NavigationDestination(
//                   icon: Icon(Iconsax.status_up), label: "Analytics"),
//               NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
//             ],
//           ),
//         ),
//         body: Obx(() => controller.screens[controller.selectedIndex.value]),
//       ),
//     );
//   }

//   Future<bool?> _showLogoutDialog(BuildContext context) {
//     return showDialog<bool>(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Logout"),
//         content: const Text("Are you sure you want to logout?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(false),
//             child: const Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(true),
//             child: const Text("Logout"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class UserNavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;

//   final screens = [
//     const UserHomeScreen(),
//     const UserModuleScreen(),
//     Container(
//       color: Colors.orange,
//     ),
//     const UserSettingScreen()
//   ];

//   final rootPages = [0, 1, 2, 3]; // Add all the indices of root pages here
// }


