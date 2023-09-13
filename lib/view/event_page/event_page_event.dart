import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/resources/resources.dart';
import '../../shared/etx/app_ext.dart';
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
  final List<String> timeEvent = [
    '<trống>',
    'Đang diễn ra',
    'Sắp diễn ra',
    'Đã diễn ra'
  ];
  final List<String> joinEvent = ['<trống>', 'Chưa tham gia', 'Đã tham gia'];

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
  }

  void _onScroll() {
    cubit.showSearchBar(scrollController.offset);
  }

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Row(
          children: [
            Container(
              constraints:
                  BoxConstraints(maxHeight: context.screenHeight * 13 / 463),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.secondary400,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: EventDropdownButton(
                tabs: timeEvent,
                buttonStyle: AppTextTheme.robotoMedium12
                    .copyWith(color: AppColor.primary500),
                dropdownColor: AppColor.white,
                hint: const Text(
                  'Thời gian',
                  textAlign: TextAlign.center,
                ),
                itemStyle: AppTextTheme.robotoLight12
                    .copyWith(color: AppColor.primary500),
                onChanged: (value) {
                  setState(() {
                    timeEventTab = value;

                    int indexTime, indexJoin;
                    for (indexTime = 0;
                        indexTime < timeEvent.length;
                        indexTime++) {
                      if (timeEvent[indexTime] == timeEventTab) break;
                    }
                    for (indexJoin = 0;
                        indexJoin < joinEvent.length;
                        indexJoin++) {
                      if (joinEvent[indexJoin] == joinEventTab) break;
                    }

                    cubit.getEventByFilter(indexTime, indexJoin - 1);
                  });
                },
                padding: const EdgeInsets.only(left: 8.0),
                underline: Container(),
                value: timeEventTab,
              ),
            ),
            const SizedBox(width: 16.0),
            Container(
              constraints:
                  BoxConstraints(maxHeight: context.screenHeight * 13 / 463),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.secondary400,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: EventDropdownButton(
                tabs: joinEvent,
                buttonStyle: AppTextTheme.robotoMedium12
                    .copyWith(color: AppColor.primary500),
                dropdownColor: AppColor.white,
                hint: const Text('Tham gia'),
                itemStyle: AppTextTheme.robotoLight12
                    .copyWith(color: AppColor.primary500),
                onChanged: (value) {
                  setState(() {
                    joinEventTab = value;

                    int indexTime, indexJoin;
                    for (indexTime = 0;
                        indexTime < timeEvent.length;
                        indexTime++) {
                      if (timeEvent[indexTime] == timeEventTab) break;
                    }
                    for (indexJoin = 0;
                        indexJoin < joinEvent.length;
                        indexJoin++) {
                      if (joinEvent[indexJoin] == joinEventTab) break;
                    }

                    cubit.getEventByFilter(indexTime, indexJoin - 1);
                  });
                },
                padding: const EdgeInsets.only(left: 8.0),
                underline: Container(),
                value: joinEventTab,
              ),
            ),
          ],
        ),
        Expanded(
          child: BlocBuilder<EventCubit, EventState>(
            buildWhen: (previous, current) =>
                current is EventInitial ||
                current is EventGetAllEventSuccessState ||
                current is EventGetEventByFilterSuccessState,
            builder: (context, state) {
              if (state is EventGetAllEventSuccessState ||
                  state is EventGetEventByFilterSuccessState) {
                final events = state is EventGetAllEventSuccessState
                    ? state.events
                    : state is EventGetEventByFilterSuccessState
                        ? state.events
                        : null;
                if (events!.isNotEmpty) {
                  final items = List.generate(events.length, (index) {
                    final event = events[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EventItem(event: event),
                        // const Divider(thickness: 5, color: AppColor.fourth300),
                        if (index == events.length - 1)
                          const SizedBox(height: 100),
                      ],
                    );
                  });
                  return AnimationStaggeredListView(
                    items: items,
                    scrollController: scrollController,
                    onRefresh: () async {
                      cubit.getAllEvent();
                    },
                  );
                } else {
                  return const NoData();
                }
              } else if (state is EventGetAllEventFailedState) {
                return const NoData();
              } else if (state is EventGetEventByFliterFailedState) {
                return const NoData();
              } else {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: EventListShimmer(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
