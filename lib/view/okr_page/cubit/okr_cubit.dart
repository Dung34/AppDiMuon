import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'okr_state.dart';

class OkrCubit extends Cubit<OkrState> {
  OkrCubit() : super(OkrInitial());

  createKeyResult() {
    emit(OkrInitial());
  }
}
