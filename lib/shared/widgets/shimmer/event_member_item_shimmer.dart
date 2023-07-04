import 'package:flutter/material.dart';

import '../../etx/app_ext.dart';
import 'container_shimmer.dart';
import 'primary_shimmer.dart';

class EventMemberItemShimmer extends StatelessWidget {
  final bool showAvatar;
  const EventMemberItemShimmer({super.key, this.showAvatar = true});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) => PrimaryShimmer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showAvatar) const CircleAvatar(radius: 20),
            if (showAvatar)
              const SizedBox(
                width: 10,
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ContainerShimmer(
                        width: context.screenWidth / 2,
                        height: 24,
                      ),
                      const Spacer(),
                      ContainerShimmer(
                        width: context.screenWidth / 6,
                        height: 24,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerShimmer(
                    height: 24,
                    width: 160,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
