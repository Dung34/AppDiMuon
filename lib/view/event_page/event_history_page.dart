import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../shared/widgets/list_view/primary_list_view.dart';
import '../../shared/widgets/shimmer/event_member_item_shimmer.dart';
import '../../shared/widgets/something/no_data.dart';
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
          title: 'Lịch sử tham dự',
          canPop: true,
        )
      : null;

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      buildWhen: (previous, current) =>
          current is EventGetAllHistorySuccessState,
      builder: (context, state) {
        if (state is EventGetAllHistorySuccessState) {
          if (state.eventMembers.isNotEmpty) {
            return PrimaryListView(
              items: List.from(
                state.eventMembers
                    .map(
                      (e) => EventMemberItem(
                        eventMember: e,
                        showTitle: true,
                        showAvatar: false,
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoute.eventDetail,
                              arguments: EventDetailPageArgs(
                                  eventId: e.eventId ?? ''));
                        },
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return const NoData();
          }
        } else {
          return const EventMemberItemShimmer(
            showAvatar: false,
          );
        }
      },
    );
  }
}
