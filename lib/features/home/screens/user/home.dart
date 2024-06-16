import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/serach_container.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/features/home/screens/user/widgets/home_appbar.dart';
import 'package:ecobako_app/features/home/screens/user/widgets/home_transaction_history.dart';
import 'package:ecobako_app/features/personalization/controllers/user_controller.dart';
import 'package:ecobako_app/features/transaction/screens/transaction_history.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.resetDataFetched(); // Reset dataFetched flag
          await controller.fetchUserRecord();
          await controller.fetchTransactions(); // Fetch user record again
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const BakoPrimaryHeaderContainer(
                child: Column(
                  children: [
                    // Appbar
                    BakoHomeAppBar(),
                    SizedBox(height: BakoSizes.spaceBtwSections),

                    // EcoBako Point
                    BakoPointContainer(),
                    SizedBox(height: BakoSizes.spaceBtwSections * 2),
                  ],
                ),
              ),

              // Body
              Padding(
                padding: const EdgeInsets.all(BakoSizes.defaultSpace),
                child: Column(
                  children: [
                    // EcoBako point section
                    // const BakoSectionHeading(
                    //   title: "BakoPoint Section",
                    //   showActionButton: false,
                    // ),
                    // const SizedBox(height: BakoSizes.spaceBtwItems / 1.5),

                    // const BakoPointSection(),

                    // const SizedBox(height: BakoSizes.spaceBtwSections),
                    BakoSectionHeading(
                      title: "Transaction History",
                      onPressed: () {
                        Get.to(() => const TransactionHistoryScreen());
                      },
                      icon: Iconsax.maximize_3,
                    ),
                    const SizedBox(height: BakoSizes.spaceBtwItems / 1.5),

                    // EcoBako Transaction History
                    UserHomeTransactionHistory(
                        transactions: controller.transactions),
                    const SizedBox(height: BakoSizes.spaceBtwItems / 1.5),
                    const Divider(),
                    Center(
                      child: Text(
                          "Showing the 5 latest transactions. Head to full transaction history page for more details.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // );
  }
}
