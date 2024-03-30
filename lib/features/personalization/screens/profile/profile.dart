import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/images/bako_circular_image.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BakoAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(BakoSizes.defaultSpace),
        child: Column(
          children: [
            // Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const BakoCircularImage(image: BakoImages.userImage, width: 80, height: 80,),
                  TextButton(onPressed: (){}, child: const Text("Change Profile Picture"),)
                ],
              ),
            ),

            //Details
            const SizedBox(height:BakoSizes.spaceBtwItems/2),
            const Divider(),
            const SizedBox(height: BakoSizes.spaceBtwItems,),
            const BakoSectionHeading(title: "Profile Information", showActionButton: false,),
            const SizedBox(height: BakoSizes.spaceBtwItems),

            BakoProfileMenu(title: 'Name', value: 'Muhammad Faris Musa', onPressed: () {}),
            BakoProfileMenu(title: 'Username', value: 'Muhammad Faris', onPressed: () {},),
            BakoProfileMenu(title: 'UserID', value: 'A0001', icon: Iconsax.copy, onPressed: () {},),

            const SizedBox(height: BakoSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: BakoSizes.spaceBtwItems),
            
            const BakoSectionHeading(title: "Personal Information", showActionButton: false,),
            const SizedBox(height: BakoSizes.spaceBtwItems),

            BakoProfileMenu(title: 'Address', value: '25 Jalan Unimas......', onPressed: () {}),
            BakoProfileMenu(title: 'Postal Code', value: '41200', onPressed: () {}),
            BakoProfileMenu(title: 'Country', value: 'Malaysia', onPressed: () {}),
            BakoProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
            BakoProfileMenu(title: 'Age', value: '23', onPressed: () {}),
            BakoProfileMenu(title: 'Email', value: 'farismusa51@gmail.com', onPressed: () {}),
            BakoProfileMenu(title: 'Phone Number', value: '+601135314516', onPressed: () {}),

            const Divider(),
            const SizedBox(height: BakoSizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () {}, 
                child: const Text("Delete Account", style: TextStyle(color: Colors.red)),
              ),
            )

          ],
        ),

      ),
    );
  }
}

