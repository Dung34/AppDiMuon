import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/user_response/user_response.dart';
import '../entity/user/user.dart';

class UserDataMapper extends BaseDataMapper<UserResponse, UserEntity> {
  @override
  UserEntity mapToEntity(UserResponse? data) {
    return UserEntity(
      id: data?.id,
      fullname: data?.fullname,
      avatar: data?.avatar,
      position: data?.major,
      company: data?.company,
    );
  }
}
