import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/resources/resources.dart';
import '../../shared/widgets/list_view/animation_listview.dart';
import '../../shared/widgets/shimmer/event_list_shimmer.dart';
import '../../shared/widgets/something/no_data.dart';
import '../base/base_page_sate.dart';
import 'components/event_dropdown_button.dart';
import 'components/event_item.dart';
import 'cubit/event_cubit.dart';

class EventPageEvent<EventCubit> extends StatefulWidget {
  const EventPageEvent({super.key});

  @override
  State<EventPageEvent> createState() => _EventPageEventState();
}

class _EventPageEventState extends BasePageState<EventPageEvent, EventCubit> {
  final List<String> timeEvent = ['Sắp diễn ra', 'Đang diễn ra', 'Đã diễn ra'];
  final List<String> joinEvent = ['Tham gia ngay', 'Đã tham gia'];

  String? timeEventTab;
  String? joinEventTab;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    cubit.getAllEvent();
    userCubit.getUser();
    cubit.showSearchBar(0);
    scrollController.addListener(_onScroll);

    timeEventTab = timeEvent[0];
    joinEventTab = joinEvent[0];
  }

  void _onScroll() {
    cubit.showSearchBar(scrollController.offset);
  }

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            EventDropdownButton(
              tabs: timeEvent,
              buttonStyle: AppTextTheme.robotoMedium12
                  .copyWith(color: AppColor.primary500),
              dropdownColor: AppColor.white,
              itemStyle: AppTextTheme.robotoLight12
                  .copyWith(color: AppColor.primary500),
              onChanged: (value) {
                setState(() {
                  timeEventTab = value;
                });
              },
              padding: const EdgeInsets.only(left: 15.0),
              value: timeEventTab,
            ),
            EventDropdownButton(
              tabs: joinEvent,
              buttonStyle: AppTextTheme.robotoMedium12
                  .copyWith(color: AppColor.primary500),
              dropdownColor: AppColor.white,
              itemStyle: AppTextTheme.robotoLight12
                  .copyWith(color: AppColor.primary500),
              onChanged: (value) {
                setState(() {
                  joinEventTab = value;
                });
              },
              padding: const EdgeInsets.only(left: 15.0),
              value: joinEventTab,
            ),
          ],
        ),
        // Expanded(
        //   child: BlocBuilder<EventCubit, EventState>(
        //     buildWhen: (previous, current) =>
        //         current is EventGetAllEventSuccessState ||
        //         current is EventInitial,
        //     builder: (context, state) {
        //       if (state is EventGetAllEventSuccessState) {
        //         final events = state.events;
        //         if (events.isNotEmpty) {
        //           final items = List.generate(events.length, (index) {
        //             final event = events[index];
        //             return Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 EventItem(event: event),
        //                 // const Divider(thickness: 5, color: AppColor.fourth300),
        //                 if (index == events.length - 1)
        //                   const SizedBox(height: 100),
        //               ],
        //             );
        //           });
        //           return AnimationStaggeredListView(
        //             items: items,
        //             scrollController: scrollController,
        //             onRefresh: () async {
        //               cubit.getAllEvent();
        //             },
        //           );
        //         } else {
        //           return const NoData();
        //         }
        //       } else if (state is EventGetAllEventFailedState) {
        //         return const NoData();
        //       } else {
        //         return const Padding(
        //           padding: EdgeInsets.all(16.0),
        //           child: EventListShimmer(),
        //         );
        //       }
        //     },
        //   ),
        // ),
      ],
    );
  }
}
