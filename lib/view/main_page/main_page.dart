import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/resources/resources.dart';
import '../event_page/calendar/calendar_page.dart';
import '../event_page/event_page.dart';
import '../membership/membership_page.dart';
import '../setting_page/setting_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _bottomNavIndex = 0;

  @override
  void initState() {
    super.initState();
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
    const CalendarPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        elevation: 4,
        onPressed: () {},
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
        },
      ),
      body: tabs[_bottomNavIndex],
    );
  }
}
