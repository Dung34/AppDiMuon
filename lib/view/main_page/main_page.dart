import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/resources/resources.dart';
import '../../shared/widgets/animated_bottom_navigation/animated_bottom_navigation_bar.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/common/common_cubit.dart';

import '../membership/membership_page.dart';

import '../setting_page/setting_page.dart';
import '../task_management/to_do_screen/manage_to_do.dart';

import '../unit_page/unit_page.dart';

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
    'To-do',
    'Unit',
    'Dự án',
    'Hồ sơ',
  ];
  final tabs = [
    const ManageToDoTask(),
    const UnitPage(),
    const MembershipPage(),
    //const SelectTenant(),
    // const CalendarPage(),
    //const SkillPage(),
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
          // Navigator.of(context).pushNamed(AppRoute.taskManager);

          // if (context.read<UserCubit>().currentUser?.role == UserRole.admin) {
          //   Navigator.of(context).pushNamed(AppRoute.eventOpening);
          // } else {
          //   Navigator.of(context).pushNamed(AppRoute.qrScanner,
          //       arguments: QrScannerPageArgs(
          //         userRole: UserRole.user,
          //       ));
          // }
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
          child: const Center(
            child: Text('Task'),
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
                      ? AppColor.green200
                      : AppColor.fourth700,
                ),
                const SizedBox(height: 4),
                Text(
                  titles[index],
                  style: _bottomNavIndex == index
                      ? AppTextTheme.textLabelSmall
                          .copyWith(color: AppColor.green200)
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
