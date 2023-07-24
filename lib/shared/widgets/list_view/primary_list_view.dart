import 'package:flutter/material.dart';

import '../../../data/resources/resources.dart';

class PrimaryListView extends StatelessWidget {
  final List<Widget> items;
  final Widget? separatorItemBuilder;
  final Future<void> Function()? onRefresh;
  PrimaryListView(
      {super.key,
      required this.items,
      this.separatorItemBuilder,
      this.onRefresh});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: onRefresh ?? () async {},
      backgroundColor: AppColor.primaryBackgroundColor,
      child: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        },
        separatorBuilder: (context, index) =>
            separatorItemBuilder ?? const SizedBox(height: 10),
      ),
    );
  }
}
