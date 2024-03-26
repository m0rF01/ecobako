import 'package:ecobako_app/common/widget/custom_shape/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class BakoCurvedEdgeWidget extends StatelessWidget {
  const BakoCurvedEdgeWidget({
    super.key,
    this.child
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BakoCustomCurvedEdges(),
      child: child,
    );
  }
}
