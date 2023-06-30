import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../interceptor/dio_base_options.dart';
import '../local/local_data_access.dart';
import 'profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = '';

  ProfileRepositoryImpl() {
    dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    ));
    dio.options =
        DioBaseOptions(baseUrl: Environment.resourcesBaseUrl).baseOption;
  }
}
