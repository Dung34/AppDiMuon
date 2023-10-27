import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/routes.dart';
import '../../../data/resources/resources.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final SkillCubit skillCubit = context.read<SkillCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(motion: ScrollMotion(), children: [
          SlidableAction(
            onPressed: ((context) {
              skillCubit.deleteSkill(skill.id ?? " ");
            }),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          )
        ]),
        child: ListTile(
            onTap: () => Navigator.pushNamed(context, AppRoute.skillUpdatePage,
                arguments: SkillPageArgs(
                    skillCubit: context.read<SkillCubit>(),
                    addNew: false,
                    skill: skill)),
            splashColor: Colors.blue[50],
            leading: Text(skill.icon ?? " "),
            title: Text(skill.name ?? " "),
            subtitle: Text(skill.description ?? " "),
            trailing: Text(skill.point.toString())),
      ),
    );
  }
}
