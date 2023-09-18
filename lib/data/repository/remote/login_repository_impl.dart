import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../exceptions/handle_exception.dart';
import '../../model/api/base_response.dart';
import '../../model/login/login_response.dart';
import '../interceptor/dio_base_options.dart';
import '../local/local_data_access.dart';
import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();

  final FlutterAppAuth appAuth = const FlutterAppAuth();
  final Dio dio;

  LoginRepositoryImpl({required this.dio}) {
    dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    ));

    dio.options =
        DioBaseOptions(baseUrl: Environment.resourcesBaseUrl).baseOption;
  }

  @override
  Future<ResponseWrapper<LoginResponse>> loginRequest({
    required String username,
    required String password,
    required bool rememberMe,
  }) async {
    try {
      final loginResponse = await dio.post(EndPoints.login, data: {
        "username": username,
        "password": password,
        "rememberMe": rememberMe,
      });

      if (loginResponse.statusCode == 200) {
        //   final defaultResponse = NewDefaultResponse<LoginResponse>.fromJson(
        //       loginResponse.data,
        //       (json) => LoginResponse.fromJson(json as Map<String, dynamic>));

        return ResponseWrapper.success(
            data: LoginResponse.fromJson(loginResponse.data));
      } else if (loginResponse.statusCode == 400 ||
          loginResponse.statusCode == 401) {
        return ResponseWrapper.error(
            message: 'Tài khoản hoặc mật khẩu không chính xác',
            statusCode: loginResponse.statusCode);
      }
      return ResponseWrapper.error(
          message: 'Đăng nhập thất bại', statusCode: loginResponse.statusCode);
    } on Exception catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: 'message');
    }
  }
}
