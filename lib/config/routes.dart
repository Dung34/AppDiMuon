import '../domain/entity/event/event_wrapper/event.dart';
import '../view/auth/register/register_page.dart';
import 'package:flutter/cupertino.dart';

import '../view/auth/login/login_page.dart';
import '../view/event_page/event_detail_page.dart';
import '../view/event_page/event_history_page.dart';
import '../view/event_page/event_member_history.dart';
import '../view/event_page/event_member_page.dart';
import '../view/event_page/event_qr_page.dart';
import '../view/home_screen/home_screen.dart';
import '../view/main_page/main_page.dart';
import '../view/setting_page/profile_update_page.dart';
import '../view/splash_screen/splash_screen.dart';

class AppRoute {
  static const String splash = "/";
  static const String main = "/main";
  static const String home = "/home";
  static const String login = "/login";
  static const String register = "/register";
  static const String eventDetail = "/eventDetail";
  static const String eventMember = "/eventMember";
  static const String eventHistory = "/eventHistory";
  static const String eventQr = "/eventQr";
  static const String eventMemberHistory = "/eventMemberHistory";
  static const String profileUpdate = "/profileUpdate";

  static dynamic generateRoute() => {
        AppRoute.login: (context) => LoginScreen(),
        AppRoute.main: (context) => const MainPage(),
        AppRoute.home: (context) => const HomeScreen(),
        AppRoute.splash: (context) => const SplashScreen(),
        AppRoute.register: (context) => RegisterPage(),
        AppRoute.eventDetail: (context) => const EventDetailPage(),
        AppRoute.eventMember: (context) => const EventMemberPage(),
        AppRoute.eventHistory: (context) => const EventHistoryPage(),
        AppRoute.eventQr: (context) => const EventQrPage(),
        AppRoute.eventMemberHistory: (context) =>
            const EventMemberHistoryPage(),
        AppRoute.profileUpdate: (context) => const ProfileUpdatePage(),
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
  final Event event;

  EventDetailPageArgs({required this.event});
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
