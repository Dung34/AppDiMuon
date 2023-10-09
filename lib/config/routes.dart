// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';

import '../domain/entity/event/event_wrapper/event.dart';
import '../domain/entity/project/project.dart';
import '../domain/entity/skill/skill.dart';
import '../domain/entity/target/target.dart';
import '../view/auth/login/login_page.dart';
import '../view/auth/register/register_page.dart';
import '../view/base/bloc/general_report/general_report_cubit.dart';
import '../view/base/bloc/report/report_cubit.dart';
import '../view/base/bloc/skill/skill_cubit.dart';

import '../view/base/bloc/target/target_cubit.dart';
import '../view/event_page/cubit/event_cubit.dart';
import '../view/event_page/event_detail_page.dart';
import '../view/event_page/event_history_page.dart';
import '../view/event_page/event_member_history.dart';
import '../view/event_page/event_member_page.dart';
import '../view/event_page/event_qr_page.dart';
import '../view/event_page/event_setting_page.dart';
import '../view/general_page/general_page.dart';
import '../view/general_page/general_report_add.dart';
import '../view/general_page/general_report_detail.dart';
import '../view/general_page/general_report_update.dart';
import '../view/home_screen/home_screen.dart';
import '../view/main_page/main_page.dart';
import '../view/project_page/cubit/project_cubit.dart';
import '../view/project_page/project_detail_page.dart';
import '../view/project_page/project_member_page.dart';
import '../view/report_page/report_add.dart';
import '../view/report_page/report_detail_view.dart';
import '../view/report_page/report_page.dart';
import '../view/report_page/report_update.dart';
import '../view/scanner_page.dart/event_opening_page.dart';
import '../view/scanner_page.dart/qr_scanner_page.dart';
import '../view/setting_page/profile_change_password.dart';
import '../view/setting_page/profile_update_page.dart';

import '../view/skill_page/skill_page.dart';
import '../view/skill_page/skill_update.dart';

import '../view/skill_page/target_page.dart';
import '../view/skill_page/update_target_page.dart';
import '../view/splash_screen/splash_screen.dart';
import '../view/unit_page/cubit/unit_cubit.dart';
import '../view/unit_page/unit_add.dart';
import '../view/unit_page/unit_detail_page.dart';
import '../view/task_management/cubit/task_cubit.dart';
import '../view/task_management/task_create_page.dart';
import '../view/task_management/task_list_page.dart';

class AppRoute {
  static const String splash = "/";
  static const String main = "/main";
  static const String home = "/home";
  static const String login = "/login";
  static const String register = "/register";
  static const String changePassword = "/changePassword";
  static const String dailyReport = "/dailyReport";
  static const String eventDetail = "/eventDetail";
  static const String eventMember = "/eventMember";
  static const String eventHistory = "/eventHistory";
  static const String eventQr = "/eventQr";
  static const String eventOpening = "/eventOpening";
  static const String eventCreate = "/eventCreate";
  static const String eventSetting = "/eventSetting";
  static const String qrScanner = "/qrScanner";
  static const String eventMemberHistory = "/eventMemberHistory";
  static const String profileUpdate = "/profileUpdate";
  static const String projectDetail = "/projectDetail";
  static const String projectMembers = "/projectMembers";
  static const String reportDetail = "/reportDetail";
  static const String addReport = "/addReport";
  static const String updateReport = "/updateReport";
  static const String generalReport = "/generalReport";
  static const String geneReportDetail = "/geneReportDetail";
  static const String geneReportAdd = "/geneReportAdd";
  static const String geneReportUpdate = "/geneReportUpdate";

  static const String unitAdd = "/unitAdd";
  static const String unitDetail = "/unitDetail";

  static const String taskManager = "/taskManager";
  static const String taskCreate = "/taskCreate";
  //skill
  static const String skillPage = "/skillPage";
  static const String skillUpdatePage = "/skillUpdatePage";
  //target

  static const String targetUpdatePage = "/targetUpdatePage";
  static const String targetPage = "/targetPage";

  static dynamic generateRoute() => {
        AppRoute.login: (context) => LoginScreen(),
        AppRoute.main: (context) => const MainPage(),
        AppRoute.home: (context) => const HomeScreen(),
        AppRoute.splash: (context) => const SplashScreen(),
        AppRoute.register: (context) => RegisterPage(),
        AppRoute.changePassword: (context) => const ProfileChangePasswordPage(),
        AppRoute.dailyReport: (context) => const ReportPage(),
        AppRoute.eventDetail: (context) => const EventDetailPage(),
        AppRoute.eventMember: (context) => const EventMemberPage(),
        AppRoute.eventHistory: (context) => const EventHistoryPage(),
        AppRoute.eventQr: (context) => const EventQrPage(),
        AppRoute.eventOpening: (context) => const EventOpeningPage(),
        AppRoute.eventSetting: (context) => const EventSettingPage(),
        // AppRoute.eventCreate: (context) => const CalendarAddPage(),
        AppRoute.qrScanner: (context) => const QrScannerPage(),
        AppRoute.eventMemberHistory: (context) =>
            const EventMemberHistoryPage(),
        AppRoute.profileUpdate: (context) => const ProfileUpdatePage(),
        AppRoute.projectDetail: (context) => const ProjectDetailPage(),
        AppRoute.projectMembers: (context) => const ProjectMemberPage(),
        AppRoute.reportDetail: (context) => const ReportDetailView(),
        AppRoute.addReport: (context) => const ReportAddPage(),
        AppRoute.updateReport: (context) => const ReportUpdatePage(),

        AppRoute.generalReport: (context) => const GeneralPage(),
        AppRoute.geneReportDetail: (context) => const GeneReportDetail(),
        AppRoute.geneReportAdd: (context) => const GeneReportAdd(),
        AppRoute.geneReportUpdate: (context) => const GenReportUpdate(),

        AppRoute.unitAdd: (context) => UnitAddPage(),
        AppRoute.unitDetail: (context) => const UnitDetailPage(),

        //skill
        AppRoute.skillPage: (context) => const SkillPage(),
        AppRoute.skillUpdatePage: (context) => const SkillUpdatePage(),

        AppRoute.taskManager: (context) => const TaskListPage(),
        AppRoute.taskCreate: (context) => const TaskCreatePage(),
        //target
        AppRoute.targetPage: (context) => const TargetPage(),
        AppRoute.targetUpdatePage: (context) => const TargetUpdatePage(),
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

class ProjectDetailPageArgs {
  final String projectId;
  final ProjectCubit projectCubit;

  ProjectDetailPageArgs({required this.projectId, required this.projectCubit});
}

class ProjectMemberPageArgs {
  final String projectId;
  final ProjectCubit projectCubit;
  final List<ProjectMember>? projectMembers;

  ProjectMemberPageArgs(
      {required this.projectId,
      required this.projectCubit,
      this.projectMembers});
}

class UnitAddPageArgs {
  final String? id;
  final UnitCubit cubit;

  const UnitAddPageArgs({this.id, required this.cubit});
}

class UnitDetailPageArgs {
  final String id;
  final UnitCubit unitCubit;

  UnitDetailPageArgs({required this.id, required this.unitCubit});
}

class ReportDailyPageArgs {
  final String reportId;
  final ReportCubit reportCubit;
  ReportDailyPageArgs({required this.reportId, required this.reportCubit});
}

class SkillPageArgs {
  final bool addNew;
  final Skill? skill;
  final SkillCubit skillCubit;
  SkillPageArgs({this.skill, required this.skillCubit, required this.addNew});
}

class TargetPageArgs {
  final bool addNew;
  final Target? target;
  final TargetCubit targetCubit;
  TargetPageArgs(
      {required this.addNew, this.target, required this.targetCubit});
}

class QrScannerPageArgs {
  final int userRole;
  final String? eventId;

  QrScannerPageArgs({
    required this.userRole,
    this.eventId,
  });
}

class GeneralReportArgs {
  final String reportId;
  final GeneralReportCubit generalReportCubit;
  GeneralReportArgs({required this.reportId, required this.generalReportCubit});
}

class TaskCreatePageArgs {
  final String? taskId;
  final TaskCubit taskCubit;
  TaskCreatePageArgs({this.taskId, required this.taskCubit});
}
