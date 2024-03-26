import 'package:ecobako_app/common/widget/custom_shape/containers/circular_container.dart';
import 'package:ecobako_app/common/widget/custom_shape/curved_edges/curved_edges_widget.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BakoPrimaryHeaderContainer extends StatelessWidget {
  const BakoPrimaryHeaderContainer({
    super.key, 
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BakoCurvedEdgeWidget(
      child: Container(
        color: BakoColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(

            // Background Custom Shape 
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: BakoCircularContainer(
                  backgroundColor: BakoColors.textWhite.withOpacity(0.1)
                )
              ),
              Positioned(
                top: 100,
                right: -300,
                child: BakoCircularContainer(
                  backgroundColor: BakoColors.textWhite.withOpacity(0.1)
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

