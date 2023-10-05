import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/api/base_response.dart';
import '../../../../data/repository/remote/skill_repository.dart';
import '../../../../data/repository/remote/skill_repository_ipml.dart';
import '../../../../di/di.dart';
import '../../../../domain/entity/skill/skill.dart';

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
      listSkill.add(skill);
      emit(SkillInitial());
      emit(AddNewSkillSuccess());
    } else {
      emit(AddNewSkillFailed());
    }
  }

  updateSkill(Skill skill) async {
    final response = await _skillRepository.updateSkill(skill);
    if (response.status == ResponseStatus.success) {
      emit(SkillInitial());
      emit(UpdateSkillSuccess(skill: skill));
    } else {
      emit(UpdateSkillFailed());
    }
  }

  deleteSkill(String id) async {
    final response = await _skillRepository.deleteSkill(id);
    if (response.status == ResponseStatus.success) {
      listSkill.removeWhere((element) => element.id == id);
      emit(DeleteSkillSuccess());
      emit(GetAllSkillSuccess(listSkill: listSkill));
    } else {
      emit(DeleteSkillFailed());
    }
  }
}
