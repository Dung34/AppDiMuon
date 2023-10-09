// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';

import '../../domain/entity/skill/skill.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/skill/skill_cubit.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends BasePageState<SkillPage, SkillCubit> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    cubit.getAllSkill();
    listSkill = cubit.listSkill;
    setAppBar = PrimaryAppBar(
      canPop: true,
      title: "Danh sách kĩ năng",
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.skillUpdatePage,
                  arguments: SkillPageArgs(skillCubit: cubit, addNew: true));
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 18,
            ))
      ],
    );
  }

  late List<Skill>? listSkill;
  @override
  Widget buildPage(BuildContext context) {
    return BlocConsumer<SkillCubit, SkillState>(
      listener: (context, state) {
        log(state.toString());
        if (state is AddNewSkillSuccess ||
            state is UpdateSkillSuccess ||
            state is DeleteSkillSuccess) {
          //log(state.toString());
          cubit.getAllSkill();
        }
      },
      builder: (context, state) {
        if (state is GetAllSkillSuccess) {
          return SizedBox(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  SkillItem(skill: listSkill![index]),
              itemCount: listSkill!.length,
            ),
          );
        } else {
          return NoData();
        }
      },
    );
  }
}

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
