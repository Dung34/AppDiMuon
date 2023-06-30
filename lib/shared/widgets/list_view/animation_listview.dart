import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationStaggeredListView extends StatelessWidget {
  final List<Widget> items;
  const AnimationStaggeredListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: items.length,
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
    );
  }
}
