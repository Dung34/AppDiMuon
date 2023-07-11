import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/shimmer/event_member_item_shimmer.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import 'components/event_member_item.dart';
import 'cubit/event_cubit.dart';

class EventHistoryPage extends StatefulWidget {
  final bool useAppBar;
  const EventHistoryPage({super.key, this.useAppBar = true});

  @override
  State<EventHistoryPage> createState() => _EventHistoryPageState();
}

class _EventHistoryPageState
    extends BasePageState<EventHistoryPage, EventCubit> {
  @override
  void initState() {
    super.initState();
    cubit.getAllHistory();
  }

  @override
  PreferredSizeWidget? get appBar => widget.useAppBar
      ? PrimaryAppBar(
          title: 'Lịch sử sự kiện',
          canPop: true,
        )
      : null;

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      buildWhen: (previous, current) =>
          current is EventGetAllHistorySuccessState,
      builder: (context, state) {
        return state is EventGetAllHistorySuccessState
            ? ListView.builder(
                itemCount: state.eventMembers.length,
                itemBuilder: (context, index) {
                  return EventMemberItem(
                    eventMember: state.eventMembers[index],
                    showTitle: true,
                    showAvatar: false,
                    canPressed: false,
                  );
                },
              )
            : const EventMemberItemShimmer(
                showAvatar: false,
              );
      },
    );
  }
}
