import '../domain/entity/event/event_wrapper/event.dart';
import '../view/auth/register/register_page.dart';
import 'package:flutter/cupertino.dart';

import '../view/auth/login/login_page.dart';
import '../view/base/bloc/report/report_cubit.dart';
import '../view/event_page/cubit/event_cubit.dart';
import '../view/event_page/event_add_page.dart';
import '../view/event_page/event_detail_page.dart';
import '../view/event_page/event_history_page.dart';
import '../view/event_page/event_member_history.dart';
import '../view/event_page/event_member_page.dart';
import '../view/event_page/event_qr_page.dart';
import '../view/home_screen/home_screen.dart';
import '../view/main_page/main_page.dart';
import '../view/report_page/report_add.dart';
import '../view/report_page/report_detail_view.dart';
import '../view/scanner_page.dart/event_opening_page.dart';
import '../view/scanner_page.dart/qr_scanner_page.dart';
import '../view/setting_page/profile_change_password.dart';
import '../view/setting_page/profile_update_page.dart';
import '../view/splash_screen/splash_screen.dart';

class AppRoute {
  static const String splash = "/";
  static const String main = "/main";
  static const String home = "/home";
  static const String login = "/login";
  static const String register = "/register";
  static const String changePassword = "/changePassword";
  static const String eventDetail = "/eventDetail";
  static const String eventMember = "/eventMember";
  static const String eventHistory = "/eventHistory";
  static const String eventQr = "/eventQr";
  static const String eventOpening = "/eventOpening";
  static const String eventCreate = "/eventCreate";
  static const String qrScanner = "/qrScanner";
  static const String eventMemberHistory = "/eventMemberHistory";
  static const String profileUpdate = "/profileUpdate";
  static const String reportDetail = "/reportDetail";
  static const String addReport = "/addReport";

  static dynamic generateRoute() => {
        AppRoute.login: (context) => LoginScreen(),
        AppRoute.main: (context) => const MainPage(),
        AppRoute.home: (context) => const HomeScreen(),
        AppRoute.splash: (context) => const SplashScreen(),
        AppRoute.register: (context) => RegisterPage(),
        AppRoute.changePassword: (context) => const ProfileChangePasswordPage(),
        AppRoute.eventDetail: (context) => const EventDetailPage(),
        AppRoute.eventMember: (context) => const EventMemberPage(),
        AppRoute.eventHistory: (context) => const EventHistoryPage(),
        AppRoute.eventQr: (context) => const EventQrPage(),
        AppRoute.eventOpening: (context) => const EventOpeningPage(),
        AppRoute.eventCreate: (context) => const CalendarAddPage(),
        AppRoute.qrScanner: (context) => const QrScannerPage(),
        AppRoute.eventMemberHistory: (context) =>
            const EventMemberHistoryPage(),
        AppRoute.profileUpdate: (context) => const ProfileUpdatePage(),
        AppRoute.reportDetail: (context) => ReportDetailView(),
        AppRoute.addReport: (context) => ReportAddPage(),
      };

  static Route? onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name!.split('/');

    if (pathElements[0] != '' || pathElements.length == 1) return null;
    switch (pathElements[1]) {
      default:
        return null;
    }
  }
}

class EventDetailPageArgs {
  final String eventId;
  final EventCubit eventCubit;
  final bool isFromCalendar;

  EventDetailPageArgs({
    required this.eventId,
    required this.eventCubit,
    this.isFromCalendar = true,
  });
}

class CalendarAddPageArgs {
  final DateTime currentSelectedDate;
  final EventCubit eventCubit;
  final bool isAddNew;
  final bool isFromCalendar;

  CalendarAddPageArgs({
    required this.currentSelectedDate,
    required this.eventCubit,
    this.isAddNew = true,
    this.isFromCalendar = true,
  });
}

class EventMemberPageArgs {
  final String eventId;

  EventMemberPageArgs({required this.eventId});
}

class EventQrPageArgs {
  final Event event;

  EventQrPageArgs({required this.event});
}

class EventMemberHistoryPageArgs {
  final String userId;

  EventMemberHistoryPageArgs({required this.userId});
}

class ReportDailyPageArgs {
  final String reportId;
  final ReportCubit reportCubit;
  ReportDailyPageArgs({required this.reportId, required this.reportCubit});
}

class QrScannerPageArgs {
  final int userRole;
  final String? eventId;

  QrScannerPageArgs({
    required this.userRole,
    this.eventId,
  });
}
