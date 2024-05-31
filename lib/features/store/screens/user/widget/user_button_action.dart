import 'package:ecobako_app/features/store/screens/user/widget/user_redeem_item_form.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProductDetailsActionButton extends StatelessWidget {
  const UserProductDetailsActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //   bottom: 80.0, // adjust as needed
        //   right: 16.0,
        //   child: FloatingActionButton(
        //     onPressed: () {
        //       // Add your first FAB button logic here
        //     },
        //     backgroundColor: BakoColors.primary,
        //     child: const Icon(Iconsax.scan_barcode,
        //     color:Colors.white,),
        //   ),
        // ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            // onPressed: () => Get.to(() => const RedeemItemForm()),
             onPressed: () {
              // RedeemItemController.instance.clearRedeemFormData();
            // showDialog(
            //   context: context,
            //   builder: (context) => const RedeemItemForm(),
            // );
            Get.to(() => const RedeemItemForm());

          },
            backgroundColor: BakoColors.primary,
            child: const Icon(Iconsax.card_coin, color: BakoColors.white,),
          ),
        )
      ],
    );
  }
}
