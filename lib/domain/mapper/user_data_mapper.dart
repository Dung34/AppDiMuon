import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/user/user_response/user_response.dart';
import '../entity/user/user.dart';

class UserDataMapper extends BaseDataMapper<UserResponse, UserEntity>
    with DataMapperMixin {
  @override
  UserEntity mapToEntity(UserResponse? data) {
    return UserEntity(
      id: data?.id,
      login: data?.login,
      firstName: data?.firstName,
      fullName: data?.fullName,
      email: data?.email,
      phoneNumber: data?.phoneNumber,
      imageUrl: data?.imageUrl,
      activated: data?.activated,
      // ignore: prefer_is_empty
      role: data?.authorities!.length == 0
          ? 0
          : data?.authorities![0] == 'ROLE_USER'
              ? 0
              : 1,
      membershipTyper: data?.membershipType,
    );
  }

  @override
  UserResponse mapToData(UserEntity entity) {
    return UserResponse(
      id: entity.id,
      login: entity.login,
      firstName: entity.firstName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      activated: entity.activated,
      authorities: [entity.role == 1 ? "ROLE_ADMIN" : "ROLE_USER"],
    );
  }
}
