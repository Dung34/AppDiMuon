import 'package:flutter_bloc/flutter_bloc.dart';

part 'common_state.dart';

class CommonCubit extends Cubit<CommonState> {
  CommonCubit() : super(CommonInitial());

  showLoading({bool dismissible = true}) {
    emit(CommonShowLoadingState(isLoading: true, isdismissible: dismissible));
  }

  hideLoading() {
    emit(CommonShowLoadingState(isLoading: false));
  }

  showToast(String message) {
    emit(CommonToastMessage(isShow: true, message: message));
  }

  hideToast() {
    emit(CommonToastMessage(isShow: false));
  }
}
