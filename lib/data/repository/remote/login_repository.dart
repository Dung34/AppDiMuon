import '../../model/api/base_response.dart';
import '../../model/login/login_response.dart';

abstract class LoginRepository {
  Future<ResponseWrapper<LoginResponse>> loginRequest({
    required String username,
    required String password,
    required bool rememberMe,
  });
}
