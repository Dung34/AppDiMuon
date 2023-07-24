import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../data/resources/colors.dart';

class AnimationStaggeredListView extends StatelessWidget {
  final List<Widget> items;
  final Future<void> Function()? onRefresh;
  final ScrollController? scrollController;
  AnimationStaggeredListView(
      {super.key, required this.items, this.onRefresh, this.scrollController});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        backgroundColor: AppColor.primaryBackgroundColor,
        onRefresh: onRefresh ?? () async {},
        child: ListView.builder(
          itemCount: items.length,
          controller: scrollController,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              duration: const Duration(milliseconds: 1000),
              position: index,
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 500),
                child: items[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
