import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/project/project.dart';
import '../../../domain/mapper/project_data_mapper.dart';
import '../../exceptions/handle_exception.dart';
import '../../model/api/base_response.dart';
import '../../model/project_list_response/project_list_response.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import 'project_list_repository.dart';

class ProjectListRepositoryImpl extends ProjectListRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = '';
  final ProjectListDataMapper _projectListDataMapper =
      getIt.get<ProjectListDataMapper>();
  final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();

  ProjectListRepositoryImpl() {
    dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    ));
    dio.interceptors.add(appInterceptor.queueInterceptor(dio: dio));
    dio.options =
        DioBaseOptions(baseUrl: Environment.resourcesBaseUrl).baseOption;
  }

  @override
  Future<ResponseWrapper<List<Project>>> getAllProject() async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.post(
        EndPoints.getAllProject,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
        data: {"page": 1, "pageSize": 5},
      );
      if (response.statusCode == 200) {
        print('Response: ${response.data}');
        return ResponseWrapper.success(
          data: List.from(
            (response as List).map((e) {
              print(e);
              return _projectListDataMapper.mapToEntity(
                ProjectListResponse.fromJson(e),
              );
            }),
          ),
        );
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }
}
