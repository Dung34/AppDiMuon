part of 'skill_cubit.dart';

abstract class SkillState extends Equatable {
  const SkillState();

  @override
  List<Object> get props => [];
}

class SkillInitial extends SkillState {}

class GetAllSkillSuccess extends SkillState {
  final List<Skill> listSkill;
  const GetAllSkillSuccess({required this.listSkill});
  @override
  List<Skill> get props => [];
}

class GetAllSkillFailed extends SkillState {}

class GetDetailSkill extends SkillState {
  final Skill skill;
  const GetDetailSkill({required this.skill});
  @override
  List<Object> get props => [];
}

class GetDetailSkillFailed extends SkillState {}

class AddNewSkillSuccess extends SkillState {
  final Skill skill;
  const AddNewSkillSuccess({required this.skill});
  @override
  List<Object> get props => [];
}

class AddNewSkillFailed extends SkillState {}

class UpdateSkillSuccess extends SkillState {
  final Skill skill;
  const UpdateSkillSuccess({required this.skill});
  @override
  List<Object> get props => [];
}

class UpdateSkillFailed extends SkillState {}

class DeleteSkillSuccess extends SkillState {
  final String id;
  const DeleteSkillSuccess({required this.id});
  @override
  List<Object> get props => [id];
}

class DeleteSkillFailed extends SkillState {}

class ResetState extends SkillState {}
