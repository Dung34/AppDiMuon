import 'package:flutter/material.dart';

import '../../config/routes.dart';
import '../../shared/etx/app_ext.dart';
import '../setting_page/component/profile_view_header.dart';
import 'event_history_page.dart';

class EventMemberHistoryPage extends StatelessWidget {
  const EventMemberHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = context.arguments as EventMemberHistoryPageArgs;
    return Container();
    // ProfileViewHeader(
    //     userId: args.userId,
    //     child: const EventHistoryPage(
    //       useAppBar: false,
    //     ));
  }
}
