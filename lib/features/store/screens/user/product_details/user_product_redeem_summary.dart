import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/images/bako_circular_image.dart';
import 'package:ecobako_app/common/widget/texts/section_heading.dart';
import 'package:ecobako_app/features/store/controllers/product_controller.dart';
import 'package:ecobako_app/features/store/screens/user/widget/confirm_transaction.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/image_strings.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({
    super.key,
    required this.productId,
    required this.quantity,
    required this.totalCost,
    required this.userEcoPointBalance,
    required this.productName,
    required this.productPrice,
    required this.userId
  });

  final String productId;
  final int quantity;
  final int totalCost;
  final int userEcoPointBalance;
  final String productName;
  final int productPrice;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final displayProductName = productName;
    final displayProductPrice = productPrice;
    final totalCost = displayProductPrice * quantity;
    final userBalance = userEcoPointBalance;
    final newBalance = userBalance - totalCost;
    final displayQuantity = quantity;

    return Scaffold(
      appBar: const BakoAppBar(
        showBackArrow: true,
        title: Text("Confirmation Summary"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(BakoSizes.defaultSpace),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BakoCircularImage(
              image: BakoImages.productRedeemImage,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: BakoSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(
              height: BakoSizes.spaceBtwItems,
            ),
            const BakoSectionHeading(
              title: "Product Details",
              showActionButton: false,
            ),
            const SizedBox(height: BakoSizes.spaceBtwItems),
            BakoConfirmRedeemMenu(title: "Product ID", value: productId),
            BakoConfirmRedeemMenu(
                title: "Product Name", value: displayProductName),
            BakoConfirmRedeemMenu(
                title: "Quantity", value: displayQuantity.toString()),
            const SizedBox(
              height: BakoSizes.spaceBtwItems,
            ),
            const Divider(),
            const SizedBox(
              height: BakoSizes.spaceBtwItems,
            ),
            const BakoSectionHeading(
              title: "Payment Details",
              showActionButton: false,
            ),
            const SizedBox(
              height: BakoSizes.spaceBtwItems,
            ),
            BakoConfirmRedeemMenu(
                title: "EcoPoint Balance", value: userBalance.toString()),
            BakoConfirmRedeemMenu(
                title: "Total Price", value: totalCost.toString()),
            BakoConfirmRedeemMenu(
                title: "New EcoPoint Balance", value: newBalance.toString()),
            const SizedBox(
              height: BakoSizes.spaceBtwItems,
            ),
            const Divider(),
            const SizedBox(
              height: BakoSizes.spaceBtwSections,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.updateDatabaseAfterRedeemProduct(
                      productId: productId,
                    quantity: quantity,
                    totalCost: totalCost,
                    newBalance: newBalance,
                    userid:userId,
                    product: productName
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: BakoColors.buttonPrimary,
                        side:
                            const BorderSide(color: BakoColors.buttonPrimary)),
                    child: const Text(BakoTexts.confirmRedeem)))
          ],
        ),
      ),
    );
  }
}
