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
  // sso related

  static const String publicAddressBaseUrl =
      "https://provinces.open-api.vn/api/p";
  //user
  static const String userRegister = "/api/register";
  static const String activeUser = "/api/activate";
  static const String deactiveUser = "/api/deactivate";
  static const String checkAuth = "/api/authenticate";
  static const String getRole = "/api/authorities";
  static const String validateUser = "/api/validateUser";
  static const String getUser = "/api/account";
  static const String postUser = "/api/account";
  static const String getInfoUser = "/api/getInformation";
  // change password
  static const String changePassword = "/api/account/change-password";
  static const String initReset = "/api/account/reset-password/init";
  //forgot password OTP
  static const String finishReset = "/api/account/reset-password/finish";
  static const String getOTP = "/api/account/forgot-password-method";
  static const String postrequestOTP = "/api/account/forgot-password-Getotp";
  static const String postCheckOTP = "/api/account/forgot-password-CheckOtp";
  static const String postCompleteOTP = "/api/account/forgot-password-complete";
  // forgot password email
  static const String postRequestOTPMail = "/api/account/verified-email-otp";
  static const String completeOTPMail = "/api/account/verified-email-complete";
  //login
  static const String login = "/api/authenticate";
  static const String getManagerInfo = "/management/info";
  // Swagger Resources ???
  static const String swaggerResources = "/swagger-resources";
  //task project
  static const String postProject = "/project";
  static const String addProjectMember = "/project/add-member";
  static const String deleteProject = "/project/detele";
  static const String deleteProjectMember = "/project/delete-member";
  static const String viewAllProject = "/project/view-all-project";
  static const String viewDetailProject = "/project/view-detail-project";
  static const String postTask = "/task";
  static const String postTaskMember = "/task/add-member";
  static const String deleteTask = "/task/delete";
  static const String getIdTask = "/task/Id";
  static const String viewAllMember = "/TaskProject/project/view-all-member'";
  static const String deleteMemberTask =
      "/TaskProject/delete-member-task-project";
  static const String getByEmployyId = "/TaskProject/Get-by-employyId";
  static const String getTaskMemberId = "/task/taskMember/Id";
  //admin
  static const String createAdmin = "/api/admin/Users";
  static const String putAdmin = "/api/admin/Users";
  static const String putAdminId = "/api/admin/Users/{id}";
  static const String getAllUser = "/api/admin/Users/GetAllUser";
  static const String getRoleAdmin = "/api/admin/Users/authorities";
  static const String searchUser = "/api/admin/Users/searchUser'";
  static const String getUserByName = "/api/admin/Users/{login}";
  static const String deleteUserByName = "/api/admin/Users/{login}";
  static const String resetPasswordbyAdmin = "/api/admin/Users/reset-password";
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
