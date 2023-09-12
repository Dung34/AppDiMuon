import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/constant/constants.dart';
import '../../data/resources/resources.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/common/common_cubit.dart';
import 'components/event_dropdown_button.dart';
import 'cubit/event_cubit.dart';
import 'event_page_checkin.dart';
import 'event_page_event.dart';

class EventPage<EventCubit> extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<StatefulWidget> createState() => _EventPageState();
}

// ignore: prefer_void_to_null
class _EventPageState extends BasePageState<EventPage, EventCubit> {
  final List<String> tabs = ['Sự kiện', 'Check-in'];
  final List<String> timeEvent = ['Sắp diễn ra', 'Đang diễn ra', 'Đã diễn ra'];
  final List<String> joinEvent = ['Tham gia ngay', 'Đã tham gia'];

  String? selectedTab;
  String? timeEventTab;
  String? joinEventTab;

  final Widget eventPageEvent = const EventPageEvent(),
      eventPageCheckin = const EventPageCheckin();
  late Widget _body;

  late Widget eventFunction, checkinFunction, function;

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  void initState() {
    super.initState();
    cubit.getAllEvent();
    userCubit.getUser();
    // cubit.showSearchBar(0);
    scrollController.addListener(_onScroll);

    selectedTab = tabs[0];
    timeEventTab = timeEvent[0];
    joinEventTab = joinEvent[0];

    eventFunction = Row(
      children: [
        PrimaryIconButton(
          context: context,
          icon: Assets.icSearch,
          iconColor: AppColor.primary500,
          onPressed: () {},
        ),
        const SizedBox(width: 5.0),
        PrimaryIconButton(
          context: context,
          icon: Assets.icNotification,
          iconColor: AppColor.primary500,
          onPressed: () {},
        )
      ],
    );
    checkinFunction = PrimaryIconButton(
      context: context,
      icon: Assets.icSetting,
      iconColor: AppColor.primary500,
      onPressed: () {
        Navigator.pushNamed(context, AppRoute.eventSetting);
      },
    );
    function = eventFunction;

    _body = eventPageEvent;
  }

  void _onScroll() {
    cubit.showSearchBar(scrollController.offset);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
  }

  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

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
<<<<<<< HEAD
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

              // PrimaryIconButton(
              //   context: context,
              //   onPressed: () {},
              //   icon: Assets.icSearch,
              // ),
              // PrimaryIconButton(
              //   context: context,
              //   onPressed: () {},
              //   icon: Assets.icNotification,
              // )
            ],
          ),
        ),
        BlocBuilder<EventCubit, EventState>(
          buildWhen: (previous, current) => current is EventShowSearchBarState,
          builder: (context, searchState) {
            if (searchState is EventShowSearchBarState) {
              return AnimatedContainer(
                height: searchState.isShow ? 50 : 0,
                duration: const Duration(milliseconds: 200),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 0),
                          child: searchState.isShow
                              ? PrimarySearchTextField(
                                  label: '',
                                  suffixIcon: searchState.isShow ? '' : null,
                                  controller: searchController,
                                  onChanged: (value) {
                                    cubit.eventFilterData.keyword = value;
                                    cubit.getAllEvent();
                                  },
                                )
                              : const SizedBox(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextButton(
                            onPressed: () => _onFilterPressed.call(context),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                BlocBuilder<EventCubit, EventState>(
                                  buildWhen: (previous, current) =>
                                      current is EventFilterChangeState,
                                  builder: (context, state) {
                                    if (state is EventFilterChangeState &&
                                        state.count > 0 &&
                                        searchState.isShow) {
                                      return Badge(
                                        label: Text(
                                          state.count.toString(),
                                          style: AppTextTheme.robotoMedium10
                                              .copyWith(
                                            color: AppColor.white,
                                          ),
                                        ),
                                        textStyle: AppTextTheme.robotoMedium10,
                                        offset: const Offset(6, -4),
                                        child:
                                            SvgPicture.asset(Assets.icFilter),
                                      );
                                    } else {
                                      return SvgPicture.asset(Assets.icFilter);
                                    }
                                  },
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Bộ lọc',
                                  style: AppTextTheme.lexendRegular14
                                      .copyWith(color: AppColor.black),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
=======
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: AppColor.fourth300)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                EventDropdownButton(
                  tabs: tabs,
                  buttonStyle: AppTextTheme.lexendBold24,
                  dropdownColor: AppColor.white,
                  itemStyle: AppTextTheme.robotoBold16
                      .copyWith(color: AppColor.primary500),
                  onChanged: (value) {
                    setState(() {
                      selectedTab = value;
                      function = selectedTab == tabs[0]
                          ? eventFunction
                          : userCubit.currentUser?.role == UserRole.user
                              ? checkinFunction
                              : Container();
                      _body = selectedTab == tabs[0]
                          ? eventPageEvent
                          : eventPageCheckin;
                    });
                  },
                  underline: Container(),
                  value: selectedTab,
                ),
                const Spacer(),
                function,
              ],
            ),
          ),
        ),
<<<<<<< HEAD
        Row(
          children: [
            EventDropdownButton(
              tabs: timeEvent,
              buttonStyle: AppTextTheme.robotoMedium12
                  .copyWith(color: AppColor.primary500),
              dropdownColor: AppColor.white,
              itemStyle: AppTextTheme.robotoLight12
                  .copyWith(color: AppColor.primary500),
              onChanged: (value) {},
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
              onChanged: (value) {},
              padding: const EdgeInsets.only(left: 15.0),
              value: joinEventTab,
            ),
          ],
>>>>>>> ff2a60f (Sửa màn hình sự kiện.)
        ),
        Expanded(
          child: BlocBuilder<EventCubit, EventState>(
            buildWhen: (previous, current) =>
                current is EventGetAllEventSuccessState ||
                current is EventInitial,
            builder: (context, state) {
              print(state.toString());
              if (state is EventGetAllEventSuccessState) {
                print("success");
                final events = state.events;
                if (events.isNotEmpty) {
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
                print("failed");
                return const NoData();
              } else {
                print("idk");
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: EventListShimmer(),
                );
              }
            },
          ),
        ),
=======
        Expanded(child: _body),
>>>>>>> f62e6c2 (1. Thêm chức năng QR Code cho các Event.)
      ],
    );
  }
}
