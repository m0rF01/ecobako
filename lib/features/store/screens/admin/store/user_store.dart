import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/common/widget/items_cards/user_item_card_verticle.dart';
import 'package:ecobako_app/common/widget/layouts/grid_layout.dart';
import 'package:ecobako_app/common/widget/shimmers/vertical_product_shimmer.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/features/store/controllers/product_controller.dart';
import 'package:ecobako_app/user_navigation_menu.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/popups/exit_ecobako_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserStoreScreen extends StatelessWidget {
   const UserStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return PopScope(
      canPop: false,
      onPopInvoked: ((didPop) async {
        if (didPop) {
          // If the user tries to navigate back from the Redeem Item screen
          return;
        }
        bool shouldCancel =
            await DialogUtils.showExitStoreConfirmation(context);
        if (shouldCancel) {
          // You can perform any additional actions if needed
          Get.off(UserNavigationMenu());
        
        }
      }),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            controller.resetProductDataFetched();
            await controller.fetchStoreProducts();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                BakoPrimaryHeaderContainer(
                  child: Column(
                    children: [
                      // appBar
                      BakoAppBar(
                        showBackArrow: true,
                        title: Text(
                          "EcoBako Store",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: BakoColors.white),
      
                        ),
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwSections),
                    ],
                  ),
                ),
      
                //body
                Padding(
                  padding: const EdgeInsets.all(BakoSizes.defaultSpace),
                  child: Column(
                    children: [
                      const BakoSectionHeading(
                        title: "Redeemable Items",
                        showActionButton: false,
                      ),
                      const SizedBox(height: BakoSizes.spaceBtwSections),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const BakoVerticalProductShimmer();
                        }
                        if (controller.storeProducts.isEmpty) {
                          return Center(
                              child: Text("No Data Found!",
                                  style: Theme.of(context).textTheme.bodyMedium));
                        }
      
                        return BakoGridLayout(
                          itemCount: controller.storeProducts.length,
                          itemBuilder: (_, index) => BakoUserItemCardVertical(
                              product: controller.storeProducts[index]),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // floatingActionButton:  UserProductDetailsActionButton(product:product),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
