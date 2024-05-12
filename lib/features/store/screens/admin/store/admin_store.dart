import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/common/widget/items_cards/item_card_vertical.dart';
import 'package:ecobako_app/common/widget/layouts/grid_layout.dart';
import 'package:ecobako_app/common/widget/shimmers/vertical_product_shimmer.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/features/store/controllers/product_controller.dart';
import 'package:ecobako_app/features/store/screens/admin/store/widget/store_action_button.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminStoreScreen extends StatelessWidget {
  const AdminStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
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
                      title: Text(
                        "EcoBako Store", 
                        style: Theme.of(context).textTheme.headlineMedium!.apply(color: BakoColors.white),
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
                    const BakoSectionHeading(title: "Redeemable Items", showActionButton: false,),
                    const SizedBox(height: BakoSizes.spaceBtwSections),
                    Obx((){
                      if (controller.isLoading.value) return const BakoVerticalProductShimmer();
                      if (controller.storeProducts.isEmpty){
                        return Center(
                          child: Text("No Data Found!", style: Theme.of(context).textTheme.bodyMedium));
                      }
                      // return BakoGridLayout(itemCount: controller.storeProducts.length, itemBuilder: (_, index) => BakoItemCardVertical(product: controller.storeProducts[index]),
                      return BakoGridLayout(itemCount: controller.storeProducts.length, itemBuilder: (_, index) => BakoItemCardVertical(product:controller.storeProducts[index]),
                      );
                    }),
                  ],
                ) ,
               ),
            ],
          ),
        ),
      ),
      floatingActionButton: const AdminStoreActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

