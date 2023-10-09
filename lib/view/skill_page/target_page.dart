import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../domain/entity/target/target.dart';
import '../../shared/widgets/something/no_data.dart';
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
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
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
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ))
      ],
    );
  }

  List<Target> listTarget = [];

  @override
  Widget buildPage(BuildContext context) {
    return BlocConsumer<TargetCubit, TargetState>(
      listener: (context, state) {
        log(state.toString());
        // if (state is GetAllTargetFailed) {
        //   cubit.getAllTarget();
        // }
        if (state is DeleteTargetSuccess ||
            state is AddNewTargetSuccess ||
            state is UpdateTargetSuccess) {
          cubit.getAllTarget();
        }
      },
      buildWhen: (previous, current) => current is GetAllTargetSuccess,
      builder: (context, state) {
        if (state is GetAllTargetSuccess) {
          listTarget = state.listTarget;
          return SizedBox(
            child: ListView.builder(
                itemBuilder: (context, index) =>
                    TargetItem(target: listTarget[index]),
                itemCount: listTarget.length),
          );
        } else {
          return NoData();
        }
      },
    );
  }
}
