import 'package:flutter/material.dart';

import '../resources/resources.dart';

enum UIState {
  init,
  loading,
  loaded,
  success,
  error,
  end;
}

class UserRole {
  static const int user = 0;
  static const int admin = 1;
}

class UserRoleStr {
  static const String user = "Thành viên";
  static const String admin = "Quản trị viên";
}

class DurationStatus {
  static const int open = 0;
  static const int closed = 1;
}

class EventStatus {
  static const int notStarted = 0;
  static const int begining = 1;
  static const int finished = 2;
  static const int canceled = 3;
}

class EventStatusStr {
  static const String notStarted = 'Sắp diễn ra';
  static const String begining = 'Đang diễn ra';
  static const String finished = 'Đã kết thúc';
  static const String canceled = 'Bị huỷ';
}

class SharedPreferenceKey {
  static const String xLicenseKey = "xLicenseKey";
  static const String idToken = "idToken";
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String username = "username";
  static const String password = "password";
  static const String rememberMe = "rememberMe";
  static const String userId = "userId";
  static const String tenantId = "tenantId";
  static const String tenantName = "tenantName";
}

class ProjectStatus {
  static const int uncompleted = 0;
  static const int completed = 1;
}

class ProjectStatusStr {
  static const String uncompleted = "Chưa hoàn thành";
  static const String completed = "Đã hoàn thành";
}

class TaskStatus {
  static const int notStarted = 0;
  static const int beginning = 1;
  static const int ended = 2;
  static const int late = 3;
}

class TaskStatusStr {
  static const String notStarted = "Not Started";
  static const String beginning = "Processing";
  static const String ended = "Ended";
  static const String late = "Late";
}

class TaskPriority {
  static const int low = 0;
  static const int medium = 1;
  static const int high = 2;
  static const int immediate = 3;
}

class TaskPriorityStr {
  static const String low = 'Low';
  static const String medium = 'Medium';
  static const String high = 'High';
  static const String immediate = 'Immediate';
}

final List<String> statusTabs = [
      'Status',
      'PROCESSING',
      'DONE',
      'AT RISK',
      'BEHIND',
      'POSTPONED'
    ],
    ownerTabs = ['Owner       '],
    processingTabs = [
      'Processing',
      '0%',
      '10%',
      '20%',
      '30%',
      '40%',
      '50%',
      '60%',
      '70%',
      '80%',
      '90%',
      '100%'
    ];
final List<RichText> statusText = [
  RichText(text: const TextSpan()),
  RichText(
      text: TextSpan(children: [
    TextSpan(
      text: '• ',
      style: AppTextTheme.robotoBold18.copyWith(color: AppColor.green200),
    ),
    TextSpan(
        text: 'PROCESSING',
        style: AppTextTheme.robotoBold14.copyWith(color: AppColor.green200))
  ])),
  RichText(
      text: TextSpan(
          text: '• ',
          style: AppTextTheme.robotoBold18.copyWith(color: AppColor.blue200),
          children: [
        TextSpan(
            text: 'DONE',
            style: AppTextTheme.robotoBold14.copyWith(color: AppColor.blue200))
      ])),
  RichText(
      text: TextSpan(
          text: '• ',
          style: AppTextTheme.robotoBold18.copyWith(color: AppColor.yellow),
          children: [
        TextSpan(
            text: 'AT RISK',
            style: AppTextTheme.robotoBold14.copyWith(color: AppColor.yellow))
      ])),
  RichText(
      text: TextSpan(
          text: '• ',
          style: AppTextTheme.robotoBold18.copyWith(color: AppColor.red200),
          children: [
        TextSpan(
            text: 'BEHIND',
            style: AppTextTheme.robotoBold14.copyWith(color: AppColor.red200))
      ])),
  RichText(
      text: TextSpan(
          text: '• ',
          style: AppTextTheme.robotoBold18.copyWith(color: AppColor.red200),
          children: [
        TextSpan(
            text: 'POSTPONED',
            style: AppTextTheme.robotoBold14.copyWith(color: AppColor.red200))
      ])),
];
