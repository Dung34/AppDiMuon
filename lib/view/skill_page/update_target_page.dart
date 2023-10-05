import 'package:flutter/material.dart';

import '../../config/routes.dart';
import '../../domain/entity/target/target.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/target/target_cubit.dart';

class TargetUpdatePage extends StatefulWidget {
  const TargetUpdatePage({super.key});

  @override
  State<TargetUpdatePage> createState() => _TargetUpdatePageState();
}

class _TargetUpdatePageState
    extends BasePageState<TargetUpdatePage, TargetCubit> {
  late Target currentTarget;
  late final Target updateTarget;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    args = context.arguments as TargetPageArgs;
    setCubit = args.targetCubit;
    currentTarget = cubit.getDetailTarget(args.id);
    updateTarget = currentTarget.copyWith();
    titleController.text = updateTarget.title ?? "";
    descriptionController.text = updateTarget.description ?? "";
    setAppBar = PrimaryAppBar(
      title: "Chỉnh sửa mục tiêu",
      canPop: true,
      actions: [
        IconButton(
            onPressed: () {
              cubit.updateTarget(updateTarget);
            },
            icon: Icon(Icons.edit))
      ],
    );
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  late final TargetPageArgs args;
  @override
  Widget buildPage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryTextField(
          controller: titleController,
          label: "Tiêu đề",
        ),
        PrimaryTextField(
          controller: descriptionController,
          label: "Mô tả",
        )
      ],
    );
  }
}
