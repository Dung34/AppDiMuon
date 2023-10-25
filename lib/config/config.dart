import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../data/resources/colors.dart';

class Environment {
  static String fileName =
      kDebugMode ? 'app_config_test.env' : 'app_config_product.env';
  static String domain = dotenv.env['DOMAIN'] ?? '';
  static String resourcesBaseUrl = dotenv.env['BASE_RESOURCE_URL'] ?? '';
  static String ssoBaseUrl = dotenv.env['SSO_BASE_URL'] ?? '';
  static String cdnBaseUrl = dotenv.env['CDN_BASE_URL'] ?? '';
}

class EndPoints {
  static const String getUserInfoSSO = '/user/updateinfo';
  static const String deactiveUser = '/api/Deactivate';

  static const String publicAddressBaseUrl =
      "https://provinces.open-api.vn/api/p";

  // user related
  static const String getCurrentUser = '/gateway/user/current';
  static const String getUser = '/api/account';
  static const String getUserById = '/api/accountByUserId';
  static const String updateUser = '/gateway/user/update';
  static const String login = '/api/authenticate';
  static const String getAccountInfo = '/api/account';
  static const String changePassword = '/api/account/change-password';
  static const String refreshToken = "/api/refresh-token";

  // event
  static const String checkinSetting = '/Checkin/checkin/setting-by-admin';
  static const String createEvent = '/gateway/event/create';
  static const String updateEvent = '/gateway/event/update';
  static const String deleteEvent = '/gateway/event/delete';
  static const String getAllEvent = '/event/view_list';
  static const String getAllCalendarEvent = '/event/calendar';
  static const String getAllFrames = '/gateway/activity/frames';
  static const String getCheckinStatistic = '/Checkin/checkin/thong-ke';
  static const String getEventById = '/event/detail';
  static const String getEventByFilter = '/event/filter';
  static const String getMeetingByUserId = '/gateway/meeting/current';
  static const String getMemberJoined = '/gateway/event-join/';
  static const String getShowHistory = '/gateway/event-joined/';
  static const String joinInEvent = '/event_member/add';

  //QR
  static const String getQRCode = '/QR';

  // employee related
  static const String getEmployeeByIdForUser =
      '/gw/Employee/GetEmployeeByIdForUser';
  static const String getMemberDetailInfo =
      '/gateway/Member/memberViewMemberInformation';
  static const String getMemberBasicInfo = '/api/getInformation';

  //key result
  static const String getAllKeyResult = '/keyResult/get-all-keyResult';

  //objective
  static const String createObjective = '/objective/create-Objective';
  static const String deleteObjective = '/objective/delete-Objective';
  static const String getAllObjectives = '/OKRs/detail-OKRs';
  static const String getObjectiveDetails = '/objective/detail-Objective';

  //OKR
  static const String createOKR = '/OKRs/create-OKR';
  static const String detailOKR = '/OKRs/detail-OKRs';

  // storage repository
  static const String uploadImage = "/gateway/Media/Upload";

  //project
  static const String getAllProject = "/project/view-all-project";
  static const String getProjectDetail = "/project/view-detail-project";

  //unit
  static const String addMemberToUnit = "/unit/add-member-to-unit";
  static const String createUnit = "/unit/create-unit";
  static const String deleteMemberFromUnit = '/unit/delete-member-from-unit';
  static const String deleteUnit = "/unit/delete-unit";
  static const String getAllUnit = "/unit/get-All-Unit-ByUserId";
  static const String getAllUserInUnit = '/unit/get-all-user-in-unit';
  static const String updateUnit = '/unit/update-unit';
  static const String viewUnit = '/unit/get-detail-unit';

  //skill
  static const String getAllSkill = "/account/get-all-skills";
  static const String getDetailSkill = "/account/get-detail-skill";
  static const String updateSkill = "/account/update-skill";
  static const String createSkill = "/account/create-skill";
  static const String deleteSkill = "/account/delete-skill";
  //target
  static const String getAllTarget = "/account/get-all-targets";
  static const String getDetailTarget = "/account/get-detail-target";
  static const String createTarget = "/account/create-target";
  static const String updateTarget = "/account/update-target";
  static const String deleteTarget = "/account/delete-target";

  // task
  static const String getAllTaskOfUser = "/taskOKR/get-all-task";
  static const String createTask = "/taskOKR/create-taskORK";
  static const String getTaskDetail = "/taskOKR/get-detail-task";
  static const String updateTask = "/taskOKR/update-taskORK";
  static const String deleteTask = "/taskOKR/delete-taskORK";
}

class SSOConfig {
  static String fileName =
      kDebugMode ? 'app_config_test.env' : 'app_config_product.env';

  static String issuer = dotenv.env['SSO_ISSUER'] ?? '';
  static String clientId = dotenv.env['SSO_CLIENT_ID'] ?? '';
  static String clientSecret = dotenv.env['SSO_CLIENT_SECRET'] ?? '';
  static String ssoApiUrl = dotenv.env['SSO_API_URL'] ?? '';
  static String redirectUrl = dotenv.env['SSO_REDIRECT_URL'] ?? '';
  static const String postLogoutRedirectUrl =
      "com.eztek.trueconnect://logout-callback";

  static const List<String> scope = [
    "openid",
    "profile",
    "email",
    "roles",
    "offline_access"
  ];

  static String register = '$issuer/Account/Register';
}

class AppConfig {
  static const String appName = "Active+";
  static const String appVersionName = "1.0.0";
  static const String fontFamily = "Roboto";
  static const Color primaryColor = AppColor.primaryColor;
  static const MaterialColor primarySwatch = AppColor.primarySwatch;
  static const double primaryFontSize = 14;
  static const FontWeight defaultFontWeight = FontWeight.w400;
  static const double defaultPadding = 16;
  static const double defaultRadius = 36;
}
