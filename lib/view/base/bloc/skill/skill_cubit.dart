import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/api/base_response.dart';
import '../../../../data/repository/remote/skill_repository.dart';
import '../../../../data/repository/remote/skill_repository_ipml.dart';
import '../../../../di/di.dart';
import '../../../../domain/entity/skill/skill.dart';
import '../../../../shared/utils/view_utils.dart';

part 'skill_state.dart';

class SkillCubit extends Cubit<SkillState> {
  final SkillRepository _skillRepository = getIt.get<SkillRepository>();

  SkillCubit() : super(SkillInitial());
  Skill? currentSkill;
  List<Skill> listSkill = [];
  getAllSkill() async {
    final response = await _skillRepository.getAllSkill();
    if (response.status == ResponseStatus.success) {
      listSkill.clear();
      listSkill.addAll(response.data ?? []);
      emit(SkillInitial());
      emit(GetAllSkillSuccess(listSkill: listSkill));
    } else {
      emit(GetAllSkillFailed());
    }
  }

  getDetailSkill(String id) async {
    final response = await _skillRepository.getDetailSkill(id);
    if (response.status == ResponseStatus.success) {
      currentSkill = response.data!;
      emit(SkillInitial());
      emit(GetDetailSkill(skill: response.data!));
    } else {
      emit(GetDetailSkillFailed());
    }
  }

  addSkill(Skill skill) async {
    final response = await _skillRepository.createSkill(skill);
    if (response.status == ResponseStatus.success) {
      listSkill.add(response.data!);

      emit(AddNewSkillSuccess(skill: response.data!));
      emit(GetAllSkillSuccess(listSkill: listSkill));
      ViewUtils.toastSuccess("Thêm kỹ năng thành công");
    } else {
      emit(AddNewSkillFailed());
      ViewUtils.toastWarning("Xảy ra lỗi !!!!");
    }
  }

  updateSkill(Skill skill) async {
    final response = await _skillRepository.updateSkill(skill);
    if (response.status == ResponseStatus.success) {
      //emit(SkillInitial());
      listSkill.removeWhere((element) => element.id == skill.id);
      listSkill.add(response.data!);
      emit(UpdateSkillSuccess(skill: response.data!));
      emit(GetAllSkillSuccess(listSkill: listSkill));
      // emit(ResetState());
      ViewUtils.toastSuccess("Chỉnh sửa kỹ năng thành công");
    } else {
      emit(UpdateSkillFailed());
      ViewUtils.toastWarning("Xảy ra lỗi !!!!");
    }
  }

  deleteSkill(String id) async {
    final response = await _skillRepository.deleteSkill(id);
    if (response.status == ResponseStatus.success) {
      listSkill.removeWhere((element) => element.id == id);

      emit(GetAllSkillSuccess(listSkill: listSkill));
      emit(DeleteSkillSuccess(id: id));
      ViewUtils.toastSuccess("Xóa kĩ năng thành công !!!!");
    } else {
      emit(DeleteSkillFailed());
      ViewUtils.toastWarning("Xảy ra lỗi !!!!");
    }
  }
}
