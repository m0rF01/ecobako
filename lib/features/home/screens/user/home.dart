import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/serach_container.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/features/home/screens/user/widgets/home_appbar.dart';
import 'package:ecobako_app/features/home/screens/user/widgets/home_bakopoint_section.dart';
import 'package:ecobako_app/features/home/screens/user/widgets/home_transaction_history.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

    @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BakoPrimaryHeaderContainer(
              child: Column(
                children: [
                  // appbar
                  BakoHomeAppBar(),
                  SizedBox(height: BakoSizes.spaceBtwSections),

                  // EcoBako Point 
                  BakoPointContainer(point: "180"),
                  SizedBox(height: BakoSizes.spaceBtwSections*2),
                ],
              ) 
            ),

            //Body
              Padding(
                padding: const EdgeInsets.all(BakoSizes.defaultSpace),
                child: Column(
                  children: [
                    // EcoBako point section
                    const BakoSectionHeading(title: "BakoPoint Section", showActionButton: false,),
                    const SizedBox(height: BakoSizes.spaceBtwItems/1.5,),

                    const BakoPointSection(),

                    const SizedBox(height: BakoSizes.spaceBtwSections),
                    BakoSectionHeading(title: "Transaction History", onPressed: (){}, icon: Iconsax.maximize_3,),
                    const SizedBox(height: BakoSizes.spaceBtwItems/1.5,),

                    //EcoBako Transaction History
                    const UserHomeTransactionHistory(),
                  ],                  
                ),
                ),
          ],
        ),
      ),
    );
  }
}






