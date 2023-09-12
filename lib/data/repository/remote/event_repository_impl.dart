import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../../domain/mapper/event_data_mapper.dart';
import '../../exceptions/handle_exception.dart';
import '../../model/api/base_response.dart';
import '../../model/event_response/event_response.dart';
import '../interceptor/dio_base_options.dart';
import '../interceptor/interceptor.dart';
import '../local/local_data_access.dart';
import 'event_repository.dart';

class EventRepositoryImpl extends EventRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = '';
  final EventDataMapper _eventDataMapper = getIt.get<EventDataMapper>();
  final AppInterceptor appInterceptor = getIt.get<AppInterceptor>();

  EventRepositoryImpl() {
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
  Future<ResponseWrapper<List<Event>>> getAllEvent({
    String? description,
    String? endDate,
    List<String>? image,
    int? isJoin,
    String? location,
    int? quantity,
    int? scanner,
    String? startDate,
    int? status,
    String? title,
  }) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final response = await dio.get(
        EndPoints.getAllEvent,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: List.from(
            (response.data as List).map(
              (e) => _eventDataMapper.mapToEntity(EventResponse.fromJson(e)),
            ),
          ),
        );
      } else {
        return ResponseWrapper.error(message: "");
      }
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<Event>> getEventById(String eventId) async {
    accessToken = await localDataAccess.getAccessToken();
    try {
      final Response response = await dio.get(
          '${EndPoints.getEventById}?Id=$eventId',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: _eventDataMapper
              .mapToEntity(EventResponse.fromJson(response.data)),
        );
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<List<Event>>> getEventByFilter(
      int status, int isJoin) async {
    accessToken = await localDataAccess.getAccessToken();

    try {
      final Response response = await dio.get(
          '${EndPoints.getEventByFilter}?Status=$status${(isJoin >= 0 ? '&IsJoin=$isJoin' : '')}',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: List.from(
            (response.data as List).map(
                (e) => _eventDataMapper.mapToEntity(EventResponse.fromJson(e))),
          ),
        );
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }

  @override
  Future<ResponseWrapper<String>> getQRCode(String eventId, String type) async {
    accessToken = await localDataAccess.getAccessToken();

    try {
      final Response response = await dio.post(EndPoints.getQRCode,
          options: Options(headers: {'Authourization': 'Bearer $accessToken'}),
          data: {'data': eventId, 'type': type});

      if (response.statusCode == 200) {
        return ResponseWrapper.success(data: response.data);
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }
}
