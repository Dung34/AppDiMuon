import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/resources/resources.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/image/primary_circle_image.dart';
import '../../shared/widgets/list_view/animation_listview.dart';
import '../../shared/widgets/something/no_data.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/user/user_cubit.dart';
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
    _eventCubit = cubit;
  }

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        BlocProvider.value(
          value: userCubit..getUser(),
          child: Padding(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        style: AppTextTheme.robotoBold16
                                            .copyWith(
                                                overflow: TextOverflow.ellipsis,
                                                color: AppColor.primary500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox();
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
        ),
        Expanded(
          child: BlocProvider.value(
            value: _eventCubit..getAllEvent(),
            child: BlocBuilder<EventCubit, EventState>(
              buildWhen: (previous, current) =>
                  current is EventGetAllEventSuccessState,
              builder: (context, state) {
                if (state is EventGetAllEventSuccessState) {
                  final events = state.events;
                  if (events.isNotEmpty) {
                    final items = List.generate(events.length, (index) {
                      final event = events[index];
                      return Column(
                        children: [
                          EventItem(event: event),
                          const Divider(
                              thickness: 5, color: AppColor.fourth300),
                          if (index == events.length - 1)
                            const SizedBox(height: 100),
                        ],
                      );
                    });
                    return AnimationStaggeredListView(
                      items: items,
                    );
                  } else {
                    return const NoData();
                  }
                } else if (state is EventGetAllEventFailedState) {
                  return const NoData();
                } else {
                  return const EventListShimmer();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
