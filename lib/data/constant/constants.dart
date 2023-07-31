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
}
