import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/images/bako_circular_image.dart';
import 'package:ecobako_app/common/widget/loaders/loaders.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
import 'package:ecobako_app/features/personalization/screens/profile/widget/change_homeaddress.dart';
import 'package:ecobako_app/features/personalization/screens/profile/widget/change_name.dart';
import 'package:ecobako_app/features/personalization/screens/profile/widget/change_username.dart';
import 'package:ecobako_app/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/common/widget/shimmers/shimmer.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const BakoAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.resetDataFetched();
          await controller.fetchUserRecord();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(BakoSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : BakoImages.userImage;
                      return controller.imageUploading.value
                          ? const BakoShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : BakoCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text("Change Profile Picture"),
                    )
                  ],
                ),
              ),
        
              //Details
              const SizedBox(height: BakoSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(
                height: BakoSizes.spaceBtwItems,
              ),
              const BakoSectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(height: BakoSizes.spaceBtwItems),
        
              Obx(() {
                return BakoProfileMenu(
                  title: 'Name',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName()),
                  icon: Iconsax.edit,
                );
              }),
              Obx(() {
                return BakoProfileMenu(
                  title: 'Username',
                  value: controller.user.value.username,
                  onPressed: () => Get.to(() => const ChangeUserName()),
                  icon: Iconsax.edit,
                );
              }),
              BakoProfileMenu(
                title: 'UserID',
                value: controller.user.value.id,
                icon: Iconsax.lock,
                onPressed: () {},
              ),
        
              const SizedBox(height: BakoSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: BakoSizes.spaceBtwItems),
        
              const BakoSectionHeading(
                title: "Personal Information",
                showActionButton: false,
              ),
              const SizedBox(height: BakoSizes.spaceBtwItems),
        
              
              Obx(() {
                return BakoProfileMenu(
                  title: 'Address',
                  value: controller.user.value.homeAddress,
                  onPressed: () => Get.to(() => const ChangeHomeAddress()),
                  icon: Iconsax.edit,
                );
              }),
              BakoProfileMenu(
                title: 'Gender',
                value: controller.user.value.gender,
                onPressed: () {
                  BakoLoaders.cannotEdit(title: "Oops!", message:"Sorry this detail cannot be edited");
                },
                icon: Iconsax.lock,
              ),
              BakoProfileMenu(
                title: 'Age',
                value: controller.user.value.age,
                onPressed: () {
                  BakoLoaders.cannotEdit(title: "Oops!", message:"Sorry this detail cannot be edited");
                },
                icon: Iconsax.lock,
              ),
              BakoProfileMenu(
                title: 'Email',
                value: controller.user.value.email,
                onPressed: () {
                  BakoLoaders.cannotEdit(title: "Oops!", message:"Sorry this detail cannot be edited");
                },
                icon: Iconsax.lock,
              ),
              BakoProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNo,
                onPressed: () {
                  BakoLoaders.cannotEdit(title: "Oops!", message:"Sorry this detail cannot be edited");
                },
                icon: Iconsax.lock,
              ),
        
              const Divider(),
              const SizedBox(height: BakoSizes.spaceBtwItems),
        
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text("Delete Account",
                      style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
