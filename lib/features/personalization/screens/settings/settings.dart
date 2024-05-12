import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/common/widget/list_tiles/settings_menu_tile.dart';
import 'package:ecobako_app/common/widget/list_tiles/user_profile_tiles.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecobako_app/features/personalization/screens/app_information/app_information.dart';
import 'package:ecobako_app/features/personalization/screens/policy_n_privacy/policy_n_privacy.dart';
import 'package:ecobako_app/features/personalization/screens/profile/profile.dart';
import 'package:ecobako_app/features/personalization/screens/terms_n_condition/terms_n_condition.dart';
import 'package:ecobako_app/features/store/screens/admin/store/user_store.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserSettingScreen extends StatelessWidget {
  const UserSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BakoPrimaryHeaderContainer(
              child: Column(
                children: [
                  // appBar
                  BakoAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: BakoColors.white),
                    ),
                  ),
                  const SizedBox(height: BakoSizes.spaceBtwSections / 2),

                  // User Profile card
                  BakoUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(
                    height: BakoSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            //body
            Padding(
                padding: const EdgeInsets.all(BakoSizes.defaultSpace),
                child: Column(
                  children: [
                    // Account Setting
                    const BakoSectionHeading(
                      title: "Account Settings",
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: BakoSizes.spaceBtwItems,
                    ),

                    // User Profile Options
                    BakoSettingMenuTile(
                      icon: Iconsax.user,
                      title: "User Profile",
                      subTitle: "Set user profile details",
                      onTap: () => Get.to(() => const ProfileScreen()),
                    ),

                    // Redeem Point Options
                    BakoSettingMenuTile(
                      icon: Iconsax.convert,
                      title: "Redeem Points",
                      subTitle: "Redeem goods from the stores",
                      onTap: () => Get.to(() => const UserStoreScreen()),
                    ),

                    // Language Options
                    BakoSettingMenuTile(
                      icon: Iconsax.text_block,
                      title: "Language",
                      subTitle: "set prefered language",
                      onTap: () {},
                    ),

                    const SizedBox(
                      height: BakoSizes.spaceBtwSections,
                    ),
                    const BakoSectionHeading(
                      title: "About App",
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: BakoSizes.spaceBtwItems,
                    ),

                    // Terms & Conditions Options
                    BakoSettingMenuTile(
                      icon: Iconsax.document_copy,
                      title: "Terms & Conditions",
                      subTitle:
                          "Details of terms & conditions of the application",
                      onTap: () => Get.to(() => const TermsNConditionScreen()),
                    ),

                    // Policy & Privacy Options
                    BakoSettingMenuTile(
                      icon: Iconsax.shield_tick,
                      title: "Policy & Privacy",
                      subTitle:
                          "Details of privacy & policy of the application",
                      onTap: () => Get.to(() => const PolicyNPrivacyScreen()),
                    ),

                    //App Information Options
                    BakoSettingMenuTile(
                      icon: Iconsax.info_circle,
                      title: "App Information",
                      subTitle: "Details information about the application",
                      onTap: () => Get.to(() => const AppInformationScreen()),
                    ),

                    //Logout Button
                    const SizedBox(
                      height: BakoSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: BakoColors.buttonPrimary)),
                        child: const Text("Logout"),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
