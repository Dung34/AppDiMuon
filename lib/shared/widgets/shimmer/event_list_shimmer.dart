import 'package:flutter/material.dart';

import '../../etx/app_ext.dart';
import 'container_shimmer.dart';
import 'primary_shimmer.dart';

class EventListShimmer extends StatelessWidget {
  const EventListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = context.screenWidth;
    return PrimaryShimmer(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ContainerShimmer(
              height: sw * 9 / 16,
              radius: 8,
              width: sw,
            ),
            const SizedBox(
              height: 20,
            ),
            ContainerShimmer(
              width: sw * 0.8,
            ),
            const SizedBox(height: 10),
            ContainerShimmer(
              width: sw * 0.7,
              height: 16,
            ),
            const SizedBox(height: 10),
            ContainerShimmer(
              width: sw * 0.5,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
