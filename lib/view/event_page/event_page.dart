import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/resources/resources.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/image/primary_circle_image.dart';
import '../../shared/widgets/list_view/animation_listview.dart';
import '../../shared/widgets/shimmer/container_shimmer.dart';
import '../../shared/widgets/shimmer/primary_shimmer.dart';
import '../../shared/widgets/something/no_data.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/common/common_cubit.dart';
import '../base/bloc/user/user_cubit.dart';
import 'components/event_filter_dialog.dart';
import 'components/event_item.dart';
import '../../shared/widgets/shimmer/event_list_shimmer.dart';
import 'cubit/event_cubit.dart';

class EventPage<EventCubit> extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<StatefulWidget> createState() => _EventPageState();
}

// ignore: prefer_void_to_null
class _EventPageState extends BasePageState<EventPage, EventCubit> {
  late final EventCubit _eventCubit;

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  void initState() {
    super.initState();
    _eventCubit = cubit..getAllEvent();
    userCubit.getUser();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final ScrollController scrollController = ScrollController();

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        BlocProvider.value(
          value: context.read<CommonCubit>(),
          child: BlocListener<CommonCubit, CommonState>(
            listener: (context, state) {
              if (state is CommonOnBottomNavigationPressed) {
                if (state.index == 0) {
                  scrollController.animateTo(0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear);
                }
              }
            },
            child: const SizedBox(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: BlocBuilder<UserCubit, UserState>(
                  buildWhen: (previous, current) =>
                      current is UserGetUserSuccessState,
                  builder: (context, state) {
                    return state is UserGetUserSuccessState
                        ? Row(
                            children: [
                              PrimaryCircleImage(
                                imageUrl: state.userEntity.avatar,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Xin chào,',
                                      style: AppTextTheme.robotoMedium14
                                          .copyWith(
                                              overflow: TextOverflow.ellipsis,
                                              color: AppColor.primary900),
                                    ),
                                    Text(
                                      '${state.userEntity.fullname ?? 'undefined'}!',
                                      style: AppTextTheme.robotoBold16.copyWith(
                                          overflow: TextOverflow.ellipsis,
                                          color: AppColor.primary500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : const PrimaryShimmer(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ContainerShimmer(
                                        height: 16,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      ContainerShimmer(width: 200),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
              ),
              // IconButton(onPressed:() {

              // }, icon: icon)
              PrimaryIconButton(
                context: context,
                onPressed: () {},
                icon: Assets.icSearch,
              ),
              PrimaryIconButton(
                context: context,
                onPressed: () {},
                icon: Assets.icNotification,
              )
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<EventCubit, EventState>(
            buildWhen: (previous, current) =>
                current is EventGetAllEventSuccessState ||
                current is EventInitial,
            builder: (context, state) {
              if (state is EventGetAllEventSuccessState) {
                final events = state.events;
                if (events.isNotEmpty) {
                  final items = List.generate(events.length, (index) {
                    final event = events[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: TextButton(
                                onPressed: () => _onFilterPressed.call(context),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(Assets.icFilter),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Bộ lọc',
                                      style: AppTextTheme.lexendRegular14
                                          .copyWith(color: AppColor.black),
                                    )
                                  ],
                                )),
                          ),
                        EventItem(event: event),
                        const Divider(thickness: 5, color: AppColor.fourth300),
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

  final statusFilterData = <bool>[false, false, false];
  final timeFilterData = <bool>[false, false, false];
  final timeRange = <String>[
    DateTime.now().toIso8601String().toString(),
    DateTime.now().toIso8601String().toString()
  ];

  void _onFilterPressed(BuildContext context) async {
    // context.showAppBottomSheet();
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventFilterDialog(
          statusFilterData: statusFilterData,
          timeFilterData: timeFilterData,
          eventCubit: cubit,
          timeRange: timeRange,
        ),
      ),
    );

    if (result != null) {
      log('ok');
      cubit.getAllEvent(startDate: timeRange[0], endDate: timeRange[1]);
    }
  }
}
