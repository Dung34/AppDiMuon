import 'package:flutter/material.dart';

import '../../etx/app_ext.dart';
import 'container_shimmer.dart';
import 'primary_shimmer.dart';

class EventListShimmer extends StatelessWidget {
  const EventListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = context.screenWidth;
    final sh = context.screenHeight;
    return PrimaryShimmer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                ContainerShimmer(
                  width: sw * 0.5,
                ),
                const Spacer(),
                ContainerShimmer(
                  width: sw * 0.2,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: ContainerShimmer(
                    height: sh * 0.3,
                    width: sw * 0.7,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ContainerShimmer(
                  height: sh * 0.3,
                  width: sw * 0.2,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                ContainerShimmer(
                  width: sw * 0.5,
                ),
                const Spacer(),
                ContainerShimmer(
                  width: sw * 0.2,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: ContainerShimmer(
                    height: sh * 0.3,
                    width: sw * 0.7,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ContainerShimmer(
                  height: sh * 0.3,
                  width: sw * 0.2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
