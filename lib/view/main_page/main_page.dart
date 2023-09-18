import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/routes.dart';
import '../../data/constant/constants.dart';
import '../../data/resources/resources.dart';
import '../../shared/widgets/animated_bottom_navigation/animated_bottom_navigation_bar.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/common/common_cubit.dart';
import '../base/bloc/user/user_cubit.dart';
import '../event_page/calendar/calendar_page.dart';
import '../event_page/event_page.dart';
import '../membership/membership_page.dart';
import '../project_page/project_page.dart';
import '../setting_page/setting_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends BasePageState<MainPage, CommonCubit>
    with TickerProviderStateMixin {
  int _bottomNavIndex = 0;

  @override
  bool get useBlocProviderValue => true;

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  bool get useSafeArea => false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setCubit = context.read<CommonCubit>();
  }

  final icons = [
    Assets.icHome,
    Assets.icIdCard,
    Assets.icCalendar,
    Assets.icSetting,
  ];
  final titles = [
    'Trang chủ',
    'Danh thiếp',
    'Sự kiện',
    'Hồ sơ',
  ];
  final tabs = [
    const EventPage(),
    const MembershipPage(),
    // const CalendarPage(),
    const ProjectPage(),
    SettingPage(),
  ];

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        elevation: 4,
        onPressed: () {
          if (context.read<UserCubit>().currentUser?.role == UserRole.admin) {
            Navigator.of(context).pushNamed(AppRoute.eventOpening);
          } else {
            Navigator.of(context).pushNamed(AppRoute.qrScanner,
                arguments: QrScannerPageArgs(
                  userRole: UserRole.user,
                ));
          }
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 8,
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.icScanner,
              color: AppColor.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: AppColor.primaryBackgroundColor,
        activeColor: Colors.orange,
        itemCount: icons.length,
        tabBuilder: (index, isActive) {
          return Center(
            child: Column(
              children: [
                const SizedBox(height: 4),
                SvgPicture.asset(
                  icons[index],
                  color: _bottomNavIndex == index
                      ? AppColor.primary500
                      : AppColor.fourth700,
                ),
                const SizedBox(height: 4),
                Text(
                  titles[index],
                  style: _bottomNavIndex == index
                      ? AppTextTheme.textLabelSmall
                          .copyWith(color: AppColor.primaryColor)
                      : AppTextTheme.textLabelSmallInactive,
                ),
              ],
            ),
          );
        },
        notchMargin: 8,
        blurEffect: true,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) {
          setState(
            () => _bottomNavIndex = index,
          );
          if (index == 0) cubit.onBottomNavigationPressed(index);
        },
      ),
      body: tabs[_bottomNavIndex],
    );
  }
}
