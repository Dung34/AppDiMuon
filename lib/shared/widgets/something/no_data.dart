import 'package:flutter/material.dart';

import '../../../data/resources/resources.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Không có dữ liệu',
        style: AppTextTheme.textLowPriority,
      ),
    );
  }
}
