import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes.dart';
import '../../../domain/entity/skill/skill.dart';
import '../../base/bloc/skill/skill_cubit.dart';

class SkillItem extends StatelessWidget {
  final Skill skill;
  const SkillItem({
    Key? key,
    required this.skill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SkillCubit skillCubit = context.read<SkillCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: SizedBox(
            child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: Colors.purple, style: BorderStyle.solid, width: 1.0)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(skill.name ?? ""),
                  Text(skill.description ?? " ")
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Text(skill.point.toString() ?? ""),
              IconButton(
                  onPressed: () {
                    skillCubit.deleteSkill(skill.id ?? " ");
                  },
                  icon: Icon(Icons.delete_outline)),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.skillUpdatePage,
                        arguments: SkillPageArgs(
                            addNew: false,
                            skill: skill,
                            skillCubit: skillCubit));
                  },
                  icon: Icon(Icons.edit))
            ],
          ),
        )),
      ),
    );
  }
}
