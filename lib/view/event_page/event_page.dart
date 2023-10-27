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
    //userCubit.getUser();
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
        Expanded(child: _body),
      ],
    );
  }
}
