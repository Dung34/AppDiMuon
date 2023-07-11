import '../../data/constant/constants.dart';
import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/user/user_response/user_response.dart';
import '../entity/user/user.dart';

class UserDataMapper extends BaseDataMapper<UserResponse, UserEntity>
    with DataMapperMixin {
  @override
  UserEntity mapToEntity(UserResponse? data) {
    return UserEntity(
      id: data?.id,
      fullname: data?.fullname,
      avatar: data?.avatar,
      // position: data?,
      role: data?.role,
      dob: data?.dob,
      roleStr: UserRoleStr.user,
      company: data?.company,
    );
  }

  @override
  UserResponse mapToData(UserEntity entity) {
    return UserResponse(
      id: entity.id,
      fullname: entity.fullname,
      avatar: entity.avatar,
      coverImage: entity.coverImage,
      dob: entity.dob,
      company: entity.company,
      position: entity.position,
      role: entity.role,
    );
  }
}
