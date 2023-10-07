// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../domain/entity/target/target.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/target/target_cubit.dart';

class TargetPage extends StatefulWidget {
  const TargetPage({super.key});

  @override
  State<TargetPage> createState() => _TargetPageState();
}

class _TargetPageState extends BasePageState<TargetPage, TargetCubit> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cubit.getAllTarget();
    listTarget = cubit.listTarget;
    setAppBar = PrimaryAppBar(
      title: "Danh sách mục tiêuuu",
      actions: [],
    );
  }

  late List<Target>? listTarget;
  @override
  Widget buildPage(BuildContext context) {
    log("message");

    // return Center(
    //   child: Text("Heloo"),
    // );
    return BlocBuilder<TargetCubit, TargetState>(
      buildWhen: (previous, current) => current is GetAllTargetSuccess,
      builder: (context, state) {
        if (state is GetAllTargetSuccess) {
          listTarget = state.listTarget;
          return SizedBox(
            child: ListView.builder(
                itemBuilder: (context, index) =>
                    TargetItem(target: listTarget![index]),
                itemCount: listTarget!.length),
          );
        }
        return NoData();
      },
    );
  }
}

class TargetItem extends StatelessWidget {
  final Target target;
  const TargetItem({
    Key? key,
    required this.target,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [Text(target.title ?? ""), Text(target.description ?? " ")],
      ),
    );
  }
}
