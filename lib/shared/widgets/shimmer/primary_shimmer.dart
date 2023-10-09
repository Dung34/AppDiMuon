import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'container_shimmer.dart';

class PrimaryShimmer extends StatelessWidget {
  const PrimaryShimmer({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 227, 227, 227),
      highlightColor: const Color.fromARGB(255, 237, 237, 237),
      period: const Duration(milliseconds: 1500),
      direction: ShimmerDirection.ltr,
      child: child ?? const ContainerShimmer(),
    );
  }
}
