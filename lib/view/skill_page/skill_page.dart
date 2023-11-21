// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../config/routes.dart';

import '../../data/repository/local/local_data_access.dart';
import '../../data/repository/remote/repository.dart';
import '../../data/resources/resources.dart';
import '../../di/di.dart';
import '../../domain/entity/skill/skill.dart';

import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/skill/skill_cubit.dart';
import 'component/skill_item.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends BasePageState<SkillPage, SkillCubit> {
  final UserRepository userRepository = getIt.get<UserRepository>();
  final LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //userRepository.refreshToken();

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
            icon: SvgPicture.asset(Assets.icAdd))
      ],
    );
  }

  late List<Skill> listSkill = [];
  @override
  Widget buildPage(BuildContext context) {
    return BlocConsumer<SkillCubit, SkillState>(
      listener: (context, state) {
        log(state.toString());
      },
      buildWhen: (previous, current) =>
          current is DeleteSkillSuccess ||
          current is AddNewSkillSuccess ||
          current is UpdateSkillSuccess ||
          current is GetAllSkillSuccess,
      builder: (context, state) {
        if (state is GetAllSkillSuccess) {
          listSkill = state.listSkill;
        } else if (state is AddNewSkillSuccess) {
        } else if (state is UpdateSkillSuccess) {
        } else if (state is DeleteSkillSuccess) {
          listSkill.removeWhere((element) => element.id == state.id);
        }
        if (listSkill.isNotEmpty) {
          return SmartRefresher(
            controller: _refreshController,
            header: const WaterDropMaterialHeader(),
            onRefresh: () async {
              cubit.getAllSkill();
              await Future.delayed(const Duration(milliseconds: 1000));
              _refreshController.refreshCompleted();
            },
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  SkillItem(skill: listSkill[index]),
              itemCount: listSkill.length,
            ),
          );
        }
        return const NoData();
      },
    );
  }
}
