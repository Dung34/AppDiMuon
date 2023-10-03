import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/api/base_response.dart';

import '../../../../data/repository/local/local_data_access.dart';
import '../../../../data/repository/remote/repository.dart';
import '../../../../data/resources/strings.dart';
import '../../../../di/di.dart';
import '../../../../domain/entity/user/user.dart';
import '../../../../shared/utils/view_utils.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository = getIt.get<UserRepository>();
  final LocalDataAccess _localDataAccess = getIt.get<LocalDataAccess>();
  UserCubit() : super(UserInitial());

  UserEntity? currentUser;

  getUser({String? userId}) async {
    if (userId == null && currentUser != null) {
      emit(UserGetUserSuccessState(userEntity: currentUser!));
      return;
    }
    emit(UserInitial());

    final response = await _userRepository.getUser(userId: userId);
    if (response.status == ResponseStatus.success) {
      if (userId == null) {
        currentUser = response.data!;
        _localDataAccess.setUserId(response.data?.id ?? '');
      }
      emit(UserGetUserSuccessState(userEntity: response.data!));
    } else {
      emit(UserGetUserFailedState());
    }
  }

  Future<UserEntity> getUserById({String? userId}) async {
    final response = await _userRepository.getUserById(userId: userId);
    if (response.status == ResponseStatus.success) {
      emit(UserGetUserSuccessState(userEntity: response.data!));

      return response.data ?? UserEntity();
    } else {
      emit(UserGetUserFailedState());

      return UserEntity();
    }
  }

  updateUser(UserEntity userEntity) async {
    final response = await _userRepository.updateUser(user: userEntity);

    if (response.status == ResponseStatus.success) {
      currentUser = userEntity;
      ViewUtils.toastSuccess(AlertText.updateSuccess);
      emit(UserUpdateSuccessState(userEntity: response.data!));
      emit(UserGetUserSuccessState(userEntity: currentUser!));
    } else {
      ViewUtils.toastWarning(AlertText.updateFailed);
      emit(UserUpdateFailedState());
    }
  }

  changePassword(
      {required String currentPassword, required String rePassword}) async {
    final response = await _userRepository.changePassword(
        currentPassword: currentPassword, rePassword: rePassword);

    if (response.status == ResponseStatus.success) {
      emit(UserChangePasswordSuccessState());
      ViewUtils.toastSuccess('Đổi mật khẩu thành công');
    } else {
      if (response.statusCode == 400) ViewUtils.toastWarning("Sai mật khẩu");
      emit(UserChangePasswordFailedState());
      ViewUtils.toastWarning(AlertText.updateFailed);
    }
  }
}
