import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/event/event_member/event_member.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../../domain/entity/event/user_event_joined.dart/user_event_joined.dart';
import '../../../domain/mapper/event_data_mapper.dart';
import '../../exceptions/handle_exception.dart';
import '../../model/api/base_response.dart';
import '../../model/event_response/event_member_response.dart';
import '../../model/event_response/event_response.dart';
import '../interceptor/dio_base_options.dart';
import '../local/local_data_access.dart';
import 'event_repository.dart';

class EventpRepositoryImpl implements EventRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = '';
  final EventDataMapper _eventDataMapper = getIt.get<EventDataMapper>();
  final EventMemberDataMapper _eventMemberDataMapper =
      getIt.get<EventMemberDataMapper>();
  // final UserDataMapper _userDataMapper = getIt.get<UserDataMapper>();

  EventpRepositoryImpl() {
    dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    ));
    dio.options =
        DioBaseOptions(baseUrl: Environment.resourcesBaseUrl).baseOption;
    // DioBaseOptions(baseUrl: 'https://api-ceo.hn7.eztek.net').baseOption;
  }

  @override
  Future<ResponseWrapper<List<Event>>> getAllEvent(
      {String? keyword,
      int type = 0,
      String? startDate,
      String? endDate,
      String? date,
      bool? isOpening}) async {
    accessToken = await localDataAccess.getAccessToken();
    final response = await dio.post(
      EndPoints.getAllEvent,
      data: {
        "title": keyword,
        "searchDate": date,
        "isComing": isOpening,
        "startDate": startDate,
        "endDate": endDate
      }..removeWhere((key, value) => value == null),
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
    try {
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: List.from(
            (response.data as List).map(
              (e) => _eventDataMapper.mapToEntity(
                EventResponse.fromJson(e),
              ),
            ),
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
  Future<ResponseWrapper<Event>> getEventById(String eventId) async {
    accessToken = await localDataAccess.getAccessToken();
    final response = await dio.get(
      '${EndPoints.getEventById}/$eventId',
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
    try {
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: _eventDataMapper.mapToEntity(
            EventResponse.fromJson(response.data),
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
  Future<ResponseWrapper<Event>> createEvent(Event event) async {
    accessToken = await localDataAccess.getAccessToken();
    final response = await dio.post(
      EndPoints.createEvent,
      data: _eventDataMapper.mapToData(event).toJson()
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
          data: _eventDataMapper.mapToEntity(
            EventResponse.fromJson(response.data),
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
  Future<ResponseWrapper<List<EventMember>>> getAllCheckedInMember(
      {required String eventId}) async {
    accessToken = await localDataAccess.getAccessToken();
    final response = await dio.get(
      '${EndPoints.getMemberJoined}$eventId',
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
    try {
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: List.from(
            (response.data as List).map(
              (e) => _eventMemberDataMapper.mapToEntity(
                EventMemberResponse.fromJson(e),
              ),
            ),
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
  Future<ResponseWrapper<List<EventMember>>> getAllHistory(
      {String? userId}) async {
    accessToken = await localDataAccess.getAccessToken();
    final String currentUserId = localDataAccess.getUserId();
    final response = await dio.get(
      '${EndPoints.getShowHistory}${userId ?? currentUserId}',
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
    try {
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: List.from(
            (response.data as List).map(
              (e) => _eventMemberDataMapper.mapToEntity(
                EventMemberResponse.fromJson(e),
              ),
            ),
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
  Future<ResponseWrapper<UserEventJoined>> joinEvent(
      {String? userId, String? eventId, String? location}) async {
    final String currentUserId = localDataAccess.getUserId();

    accessToken = await localDataAccess.getAccessToken();
    final response = await dio.post(
      EndPoints.joinShow,
      data: {
        "userId": userId ?? currentUserId,
        "eventId": eventId,
        "location": location,
      }..removeWhere((key, value) => value == null),
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
    try {
      if (response.statusCode == 200) {
        return ResponseWrapper.success(
          data: UserEventJoined.fromJson(response.data),
        );
      }
      return ResponseWrapper.error(message: "");
    } catch (e) {
      handleException(e);
      return ResponseWrapper.error(message: "");
    }
  }
}
