import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/config.dart';
import '../../../di/di.dart';
import '../../../domain/entity/event/event_member/event_member.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../constant/constants.dart';
import '../../model/api/base_response.dart';
import '../interceptor/dio_base_options.dart';
import '../local/local_data_access.dart';
import 'event_repository.dart';

class EventpRepositoryImpl implements EventRepository {
  final Dio dio = getIt.get<Dio>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String accessToken = '';

  EventpRepositoryImpl() {
    dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    ));
    dio.options =
        DioBaseOptions(baseUrl: Environment.resourcesBaseUrl).baseOption;
  }

  @override
  Future<ResponseWrapper<List<Event>>> getAllEvent({int type = 0}) async {
    return ResponseWrapper.success(data: [
      Event(
        id: '',
        // userFullname: 'CEO Vũ Trường Giang',
        // userAvatar:
        //     'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=2000',
        type: 'Công nghệ',
        title: 'Lớp học CEO HN Tháng 7 - Buổi 1',
        description: 'Ra mắt TrueConnect ',
        location: '66A, Nguyễn Sỹ Sách, Q. Tân Bình, TPHCM',
        background:
            'https://knowtechie.com/wp-content/uploads/2023/01/premier-league-soccer-banner-1600x900.webp',
        checked: true,
        status: EventStatus.begining,
        statusStr: EventStatusStr.begining,
        startTime: '2023-06-13T02:19:32Z',
        endTime: '2023-06-13T010:19:32Z',
        totalUserCount: 123,
      ),
      Event(
        id: '',
        // userFullname: 'CEO Vũ Trường Giang',
        // userAvatar:
        //     'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=2000',
        type: 'Công nghệ',
        title: 'Lớp học CEO HN Tháng 7 - Buổi 2',
        description: 'EPL is back | Premier league, League, Movies',
        location: '66A, Nguyễn Sỹ Sách, Q. Tân Bình, TPHCM',
        status: EventStatus.notStarted,
        statusStr: EventStatusStr.notStarted,
        background:
            'https://i.pinimg.com/originals/85/9e/09/859e09d484ef4e43c522052682db0550.jpg',
        checked: false,
        startTime: '2023-06-13T02:19:32Z',
        endTime: '2023-06-13T010:19:32Z',
        totalUserCount: 210,
      ),
      Event(
        id: '',
        // userFullname: 'CEO Vũ Trường Giang',
        // userAvatar:
        //     'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=2000',
        type: 'Công nghệ',
        description: 'Công nghệ',
        location: '66A, Nguyễn Sỹ Sách, Q. Tân Bình, TPHCM',
        status: EventStatus.finished,
        statusStr: EventStatusStr.finished,
        background:
            'https://knowtechie.com/wp-content/uploads/2023/01/premier-league-soccer-banner-1600x900.webp',
        checked: true,
        startTime: '2023-06-13T02:19:32Z',
        endTime: '2023-06-13T010:19:32Z',
        totalUserCount: 210,
      ),
    ]);
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
}
