import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../config/routes.dart';
import '../../domain/entity/target/target.dart';

import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/target/target_cubit.dart';
import 'component/target_item.dart';

class TargetPage extends StatefulWidget {
  const TargetPage({super.key});

  @override
  State<TargetPage> createState() => _TargetPageState();
}

class _TargetPageState extends BasePageState<TargetPage, TargetCubit> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cubit.getAllTarget();
    setAppBar = PrimaryAppBar(
      title: "Danh sách kĩ năng",
      canPop: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.targetUpdatePage,
                  arguments: TargetPageArgs(addNew: true, targetCubit: cubit));
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ))
      ],
    );
  }

  late List<Target> listTarget = [];

  @override
  Widget buildPage(BuildContext context) {
    return BlocConsumer<TargetCubit, TargetState>(
      listener: (context, state) {
        log(state.toString());
      },
      buildWhen: (previous, current) =>
          current is GetAllTargetSuccess ||
          current is DeleteTargetSuccess ||
          current is UpdateTargetSuccess ||
          current is AddNewTargetSuccess,
      builder: (context, state) {
        if (state is GetAllTargetSuccess) {
          listTarget = state.listTarget;
        } else if (state is DeleteTargetSuccess) {
          listTarget.removeWhere((element) => element.id == state.id);
        }

        return SmartRefresher(
          controller: _refreshController,
          header: const WaterDropMaterialHeader(),
          onRefresh: () async {
            cubit.getAllTarget();

            await Future.delayed(const Duration(milliseconds: 1000));
            _refreshController.refreshCompleted();
          },
          child: ListView.builder(
            itemBuilder: (context, index) =>
                TargetItem(target: listTarget[index]),
            itemCount: listTarget.length,
          ),
        );
      },
    );
  }
}
