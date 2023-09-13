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
      email: data?.email,
      phoneNumber: data?.phoneNumber,
      activated: data?.activated,
      langKey: data?.langKey,
      createdBy: data?.createdBy,
      createdDate: data?.createdDate,
      lastModifiedBy: data?.lastModifiedBy,
      lastModifiedDate: data?.lastModifiedDate,
      role: data?.authorities![0] == "ROLE_ADMIN" ? 1 : 0,
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
      langKey: entity.langKey,
      createdBy: entity.createdBy,
      createdDate: entity.createdDate,
      lastModifiedBy: entity.lastModifiedBy,
      lastModifiedDate: entity.lastModifiedDate,
      authorities: [entity.role == 1 ? "ROLE_ADMIN" : "ROLE_USER"],
    );
  }
}
