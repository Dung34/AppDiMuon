import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/user/user.dart';
import '../../../domain/mapper/user_data_mapper.dart';
import '../../exceptions/handle_exception.dart';
import '../../model/api/base_response.dart';

import '../../model/login/login_response.dart';
import '../../model/user/user_response/user_response.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import 'repository.dart';

class UserRepositoryImpl implements UserRepository {
  final Dio dio;
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  //final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();
  final UserDataMapper _userDataMapper = getIt.get<UserDataMapper>();

  UserRepositoryImpl({required this.dio}) {
    dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    ));
    //dio.interceptors.add(appInterceptor.queueInterceptor(dio: dio));
    dio.options =
        DioBaseOptions(baseUrl: Environment.resourcesBaseUrl).baseOption;
  }

  String accessToken = '';

  @override
  Future<ResponseWrapper<LoginResponse>> loginRequest({
    required String username,
    required String password,
    required bool rememberMe,
  }) async {
    try {
      final loginResponse = await dio.post(
        '/api/authenticate',
        data: {
          'username': username,
          'password': password,
          'rememberMe': rememberMe
        },
      );
      if (loginResponse.statusCode == 200) {
        final LoginResponse response =
            LoginResponse.fromJson(loginResponse.data);
        await localDataAccess.setAccessToken(response.accessToken!);
        await localDataAccess.setRefreshToken(response.refreshToken!);
        log(response.accessToken!);
        log(response.refreshToken!);
        return ResponseWrapper.success(data: response);
      } else if (loginResponse.statusCode == 400 ||
          loginResponse.statusCode == 401) {
        return ResponseWrapper.error(
            message: 'Tài khoản hoặc mật khẩu không chính xác',
            statusCode: loginResponse.statusCode);
      } else {
        return ResponseWrapper.error(
            message: 'Đăng nhập thất bại',
            statusCode: loginResponse.statusCode);
      }
    } on Exception catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: e.toString());
    }
  }

  @override
  Future<Response> getForgotPasswordMethod({required String username}) async {
    final response = await dio.get('/api/account/forgot-password-method',
        queryParameters: {"Login": username});
    return response;
  }

  @override
  Future<Response> sendOTP(
      {required String username,
      required String type,
      required String value}) async {
    final response = await dio.post(
      '/api/account/forgot-password-Getotp',
      data: {
        "login": username,
        "type": type,
        "value": value,
      },
    );
    return response;
  }

  @override
  Future<Response> checkOTP(
      {required String username, required String key}) async {
    final response = await dio.post(
      '/api/account/forgot-password-CheckOtp',
      data: {
        "login": username,
        "key": key,
      },
    );
    return response;
  }

  @override
  Future<Response> forgotPasswordComplete(
      {required String newPassword,
      required String username,
      required String key}) async {
    final body =
        jsonEncode({"newPassword": newPassword, "login": username, "key": key});
    final response =
        await dio.post('/api/account/forgot-password-complete', data: body);
    return response;
  }

  @override
  Future<Response> verifiedEmailOtp(
      {required String username, required String value}) async {
    final body = jsonEncode({"login": username, "value": value});
    final response =
        await dio.post('/api/account/verified-email-otp', data: body);
    return response;
  }

  @override
  Future<Response> verifiedEmailComplete(
      {required String username, required String key}) async {
    final body = jsonEncode({"login": username, "key": key});
    final response =
        await dio.post('/api/account/verified-email-complete', data: body);
    return response;
  }

  @override
  Future<Response> getInformation() async {
    final String accessToken = await localDataAccess.getAccessToken();
    final response = await dio.get('/api/getInformation',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ));
    return response;
  }

  @override
  Future<ResponseWrapper<bool>> changePassword(
      {required String currentPassword, required String rePassword}) async {
    final String accessToken = await localDataAccess.getAccessToken();
    final response = await dio.post(EndPoints.changePassword,
        data: {"currentPassword": currentPassword, "newPassword": rePassword},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ));
    try {
      if (response.statusCode == 200) {
        return ResponseWrapper.success(data: true);
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<Response> vcfFile(
      {required String username, required Object body}) async {
    final mBody = jsonEncode(body);
    final response = await dio.post('/gateway/Member/vcfFile',
        data: mBody, queryParameters: {"Username": username});
    return response;
  }

  @override
  Future<Response> getDetailMedia(
      {required String memberId, required String type}) async {
    final response = await dio.get(
        '${Environment.resourcesBaseUrl}/gateway/Member/memberViewMemberDetailMedia',
        queryParameters: {"memberId": memberId, "type": type});
    return response;
  }

  @override
  Future<ResponseWrapper<UserEntity>> getUser({String? userId}) async {
    accessToken = await localDataAccess.getAccessToken();
    final response = await dio.get(
      EndPoints.getUser,
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
    try {
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _userDataMapper
                .mapToEntity(UserResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<UserEntity>> getUserById({String? userId}) async {
    accessToken = await localDataAccess.getAccessToken();

    final response = await dio.get('${EndPoints.getUserById}?Id=$userId',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

    try {
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _userDataMapper
                .mapToEntity(UserResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<UserEntity>> updateUser(
      {required UserEntity user}) async {
    accessToken = await localDataAccess.getAccessToken();
    final response = await dio.patch(
      EndPoints.getCurrentUser,
      data: _userDataMapper.mapToData(user).toJson()
        ..removeWhere(
          (key, value) => value == null,
        ),
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
    try {
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
            data: _userDataMapper
                .mapToEntity(UserResponse.fromJson(response.data)));
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<bool>> refreshToken() async {
    accessToken = await localDataAccess.getAccessToken();
    String refreshToken = await localDataAccess.getRefreshToken();
    try {
      final response = await dio.post(EndPoints.refreshToken,
          data: {"accessToken": accessToken, "refreshToken": refreshToken});
      if (response.statusCode == 200) {
        final LoginResponse loginResponse =
            LoginResponse.fromJson(response.data);
        await localDataAccess.setAccessToken(loginResponse.accessToken!);
        await localDataAccess.setRefreshToken(loginResponse.refreshToken!);
        accessToken = loginResponse.accessToken!;
        refreshToken = loginResponse.refreshToken!;
        log(" access token :  $accessToken");
        log(" refresh token : $refreshToken");
        return ResponseWrapper.success(data: true);
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      return ResponseWrapper.error(message: "");
    }
  }
}
