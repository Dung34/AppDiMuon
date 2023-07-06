import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/event/event_member/event_member.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../../domain/mapper/event_data_mapper.dart';
import '../../exceptions/handle_exception.dart';
import '../../model/api/base_response.dart';
import '../../model/event_response/event_response.dart';
import '../interceptor/dio_base_options.dart';
import '../local/local_data_access.dart';
import 'event_repository.dart';

class EventpRepositoryImpl implements EventRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = '';
  final EventDataMapper _eventDataMapper = getIt.get<EventDataMapper>();

  EventpRepositoryImpl() {
    dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    ));
    dio.options =
        // DioBaseOptions(baseUrl: Environment.resourcesBaseUrl).baseOption;
        DioBaseOptions(baseUrl: 'https://api-ceo.hn7.eztek.net').baseOption;
  }

  @override
  Future<ResponseWrapper<List<Event>>> getAllEvent(
      {String? keyword, int type = 0, String? date, bool? isOpening}) async {
    accessToken = await localDataAccess.getAccessToken();
    final response = await dio.post(
      EndPoints.getAllEvent,
      data: {
        "title": keyword,
        "searchDate": date,
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
    return ResponseWrapper.success(data: [
      EventMember(
        id: '',
        fullname: 'Vương Tùng Giang',
        avatar:
            'https://knowtechie.com/wp-content/uploads/2023/01/premier-league-soccer-banner-1600x900.webp',
        checkedInDate: '2023-06-13T10:19:32Z',
        checkedInLocation:
            '89 Hoàng Văn Thái, Khuong Trung, Thanh Xuân, Hà Nội',
      ),
      EventMember(
        id: '',
        fullname: 'Vương Tùng Giang Vương Tùng Giang',
        avatar:
            'https://knowtechie.com/wp-content/uploads/2023/01/premier-league-soccer-banner-1600x900.webp',
        checkedInDate: '2023-06-13T10:19:32Z',
        checkedInLocation:
            '89 Hoàng Văn Thái, Khuong Trung, Thanh Xuân, Hà Nội',
      ),
      EventMember(
        id: '',
        fullname: 'Vương Tùng Giang',
        avatar:
            'https://knowtechie.com/wp-content/uploads/2023/01/premier-league-soccer-banner-1600x900.webp',
        checkedInDate: '2023-06-13T10:19:32Z',
        checkedInLocation:
            '89 Hoàng Văn Thái, Khuong Trung, Thanh Xuân, Hà Nội',
      ),
    ]);
  }

  @override
  Future<ResponseWrapper<List<EventMember>>> getAllHistory() async {
    return ResponseWrapper.success(data: [
      EventMember(
        id: '',
        fullname: 'Vương Tùng Giang',
        eventTitle: 'Buổi 1',
        avatar:
            'https://knowtechie.com/wp-content/uploads/2023/01/premier-league-soccer-banner-1600x900.webp',
        checkedInDate: '2023-06-13T10:19:32Z',
        checkedInLocation:
            '89 Hoàng Văn Thái, Khuong Trung, Thanh Xuân, Hà Nội',
      ),
      EventMember(
        id: '',
        fullname: 'Vương Tùng Giang Vương Tùng Giang',
        eventTitle: 'Buổi 12',
        avatar:
            'https://knowtechie.com/wp-content/uploads/2023/01/premier-league-soccer-banner-1600x900.webp',
        checkedInDate: '2023-06-13T10:19:32Z',
        checkedInLocation:
            '89 Hoàng Văn Thái, Khuong Trung, Thanh Xuân, Hà Nội',
      ),
      EventMember(
        id: '',
        fullname: 'Vương Tùng Giang',
        eventTitle: 'Buổi 13',
        avatar:
            'https://knowtechie.com/wp-content/uploads/2023/01/premier-league-soccer-banner-1600x900.webp',
        checkedInDate: '2023-06-13T10:19:32Z',
        checkedInLocation:
            '89 Hoàng Văn Thái, Khuong Trung, Thanh Xuân, Hà Nội',
      ),
    ]);
  }
}
