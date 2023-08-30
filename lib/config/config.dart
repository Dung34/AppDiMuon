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
  static const String deactiveUser = '/user/de-active';

  static const String publicAddressBaseUrl =
      "https://provinces.open-api.vn/api/p";

  // user related
  static const String getCurrentUser = '/gateway/user/current';
  static const String getUser = '/gateway/user';
  static const String updateUser = '/gateway/user/update';
  static const String login = '/connect/login';
  static const String getAccountInfo = '/api/account';
  static const String changePassword = '/api/account/change-password';

  // event
  static const String getMeetingByUserId = '/gateway/meeting/current';
  static const String createEvent = '/gateway/event/create';
  static const String updateEvent = '/gateway/event/update';
  static const String deleteEvent = '/gateway/event/delete';
  static const String getEventById = '/gateway/event';
  static const String getAllEvent = '/gateway/events';
  static const String getAllCalendarEvent = '/gateway/Calendar/events';
  static const String getAllFrames = '/gateway/activity/frames';
  static const String joinShow = '/gateway/event-join/create';
  static const String getMemberJoined = '/gateway/event-join/';
  static const String getShowHistory = '/gateway/event-joined/';

  // employee related
  static const String getEmployeeByIdForUser =
      '/gw/Employee/GetEmployeeByIdForUser';
  static const String getMemberDetailInfo =
      '/gateway/Member/memberViewMemberInformation';
  static const String getMemberBasicInfo = '/api/getInformation';

  // storage repository
  static const String uploadImage = "/gateway/Media/Upload";
<<<<<<< HEAD

  //project
  static const String getAllProject = '/project/view-all-project';
=======
  // sso related

  //user
  static const String userRegisterActive = "/api/register";
  static const String activeUserActive = "/api/activate";
  static const String deactiveUserActive = "/api/deactivate";
  static const String checkAuthActive = "/api/authenticate";
  static const String getRoleActive = "/api/authorities";
  static const String validateUserActive = "/api/validateUser";
  static const String getUserActive = "/api/account";
  static const String postUserActive = "/api/account";
  static const String getInfoUserActive = "/api/getInformation";
  // change password
  static const String changePasswordActive = "/api/account/change-password";
  static const String initResetActive = "/api/account/reset-password/init";
  //forgot password OTP
  static const String finishResetActive = "/api/account/reset-password/finish";
  static const String getOTPActive = "/api/account/forgot-password-method";
  static const String postrequestOTPActive =
      "/api/account/forgot-password-Getotp";
  static const String postCheckOTPActive =
      "/api/account/forgot-password-CheckOtp";
  static const String postCompleteOTPActive =
      "/api/account/forgot-password-complete";
  // forgot password email
  static const String postRequestOTPMailActive =
      "/api/account/verified-email-otp";
  static const String completeOTPMailActive =
      "/api/account/verified-email-complete";
  //login
  static const String loginActive = "/api/authenticate";
  static const String getManagerInfoActive = "/management/info";
  // Swagger Resources ???
  static const String swaggerResourcesActive = "/swagger-resources";
  //task project
  static const String postProjectActive = "/project";
  static const String addProjectMemberActive = "/project/add-member";
  static const String deleteProjectActive = "/project/detele";
  static const String deleteProjectMemberActive = "/project/delete-member";
  static const String viewAllProjectActive = "/project/view-all-project";
  static const String viewDetailProjectActive = "/project/view-detail-project";
  static const String postTaskActive = "/task";
  static const String postTaskMemberActive = "/task/add-member";
  static const String deleteTaskActive = "/task/delete";
  static const String getIdTaskActive = "/task/Id";
  static const String viewAllMemberActive =
      "/TaskProject/project/view-all-member'";
  static const String deleteMemberTaskActive =
      "/TaskProject/delete-member-task-project";
  static const String getByEmployyIdActive = "/TaskProject/Get-by-employyId";
  static const String getTaskMemberIdActive = "/task/taskMember/Id";
  //admin
  static const String createAdminActive = "/api/admin/Users";
  static const String putAdminActive = "/api/admin/Users";
  static const String putAdminIdActive = "/api/admin/Users/{id}";
  static const String getAllUserActive = "/api/admin/Users/GetAllUser";
  static const String getRoleAdminActive = "/api/admin/Users/authorities";
  static const String searchUserActive = "/api/admin/Users/searchUser'";
  static const String getUserByNameActive = "/api/admin/Users/{login}";
  static const String deleteUserByNameActive = "/api/admin/Users/{login}";
  static const String resetPasswordbyAdminActive =
      "/api/admin/Users/reset-password";
>>>>>>> 6642d4e1f8bfa9be2a9b8f123d5a714094c66e74
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
  static const double defaultRadius = 8;
}
