// new data for today
import 'package:ecobako_app/features/transaction/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:ecobako_app/common/widget/layouts/grid_layout.dart';
import 'package:ecobako_app/common/widget/rounded_container/rounded_container.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class UserHomeTransactionHistory extends StatelessWidget {
  final List<TransactionModel> transactions;

  const UserHomeTransactionHistory({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (transactions.isEmpty) {
        return const Center(
          child: Text(
            "No data found",
            style: TextStyle(fontSize: 16),
          ),
        );
      } else {
        return BakoGridLayout(
          itemCount: transactions.length,
          mainAxisExtent: 70,
          crossAxisCount: 1,
          itemBuilder: (_, index) {
            final transaction = transactions[index];
            // Determine icon and text color based on transaction type
            IconData iconData;
            Color iconColor;
            String amountText;
            if (transaction.type == 'Add') {
              iconData = Iconsax.add_circle5; // Change to appropriate icon for add
              iconColor = BakoColors.primary;
              amountText = '+${transaction.amount}';
            } else {
              iconData = Iconsax.minus_cirlce5; // Change to appropriate icon for deduct
              iconColor = Colors.red;
              amountText = '-${transaction.amount}';
            }

              // Format the date
            final formattedDate =
                DateFormat('dd/MM/yyyy HH:mm:ss').format(transaction.date);

            return GestureDetector(
              onTap: () {},
              child: BakoRoundedContainer(
                padding: const EdgeInsets.all(BakoSizes.sm),
                showBorder: true,
                backgroundColor: Colors.transparent,
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Flexible(
                    //   child: BakoCircularImage(
                    //     isNetworkImage: false,
                    //     image: BakoImages.clothIcon,
                    //     backgroundColor: Colors.transparent,
                    //     overlayColor: BakoHelperFunctions.isDarkMode(context)
                    //         ? BakoColors.white
                    //         : BakoColors.black,
                    //   ),
                    // ),
                    // Icon indicating transaction type
                    Icon(
                      iconData,
                      color: iconColor,
                    ),
                    const SizedBox(width: BakoSizes.spaceBtwInputFields),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.description,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(width: BakoSizes.spaceBtwSections),
                          Text(
                            formattedDate, // Format date as needed
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          amountText,
                          textAlign: TextAlign.right, // Align text to the right
                          style: TextStyle(
                            color: iconColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}

