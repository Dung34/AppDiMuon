import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/colors.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/unit/unit.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/image/primary_image.dart';
import '../../shared/widgets/something/loading.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import 'cubit/unit_cubit.dart';

class UnitDetailPage extends StatefulWidget {
  const UnitDetailPage({super.key});

  @override
  State<UnitDetailPage> createState() => _UnitDetailPage();
}

class _UnitDetailPage extends BasePageState<UnitDetailPage, UnitCubit> {
  late final UnitDetailPageArgs args;
  late Unit unit;

  @override
  bool get isUseLoading => true;

  @override
  bool get useBlocProviderValue => true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as UnitDetailPageArgs;
    setCubit = args.unitCubit;

    cubit.viewUnit(args.id);
  }

  delete() {
    cubit.deleteUnit(args.id);
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<UnitCubit, UnitState>(
        buildWhen: (previous, current) =>
            current is UnitCreateUnitSuccessState ||
            current is UnitDeleteUnitSuccessState ||
            current is UnitGetUnitDetailSuccessState ||
            current is UnitResetState,
        builder: (context, state) {
          if (state is UnitGetUnitDetailSuccessState) {
            unit = state.unit;
          }
          if (state is UnitCreateUnitSuccessState) {
            unit.subUnit = List.from(unit.subUnit ?? [])..add(state.unit);
          }
          if (state is UnitResetState) {
            return const Loading();
          }
          return Scaffold(
            appBar: PrimaryAppBar(
              actions: [
                PrimaryIconButton(
                    context: context,
                    icon: Icons.delete,
                    onPressed: () {
                      delete();
                      context.pop();
                    }),
                PrimaryIconButton(
                    context: context,
                    icon: Icons.add,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.unitAdd,
                          arguments:
                              UnitAddPageArgs(cubit: cubit, id: unit.id));
                    }),
              ],
              leading: PrimaryIconButton(
                context: context,
                icon: Icons.arrow_back_ios_rounded,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: unit.name ?? '',
            ),
            backgroundColor: AppColor.gray50,
            body: Column(
              children: [
                const SizedBox(height: 8.0),
                const SizedBox(height: 8.0),
                Text('Id: ${unit.id}'),
                Text('Name: ${unit.name}'),
                Text('Parrent Id: ${unit.parrentId}'),
                Text('Description: ${unit.description}'),
                const Text('Cover Image:'),
                PrimaryNetworkImage(imageUrl: unit.coverImage),
                Text('Member quantity: ${unit.totalMemberCount}'),
                Text(
                    'Các unit con (em lười List.generate quá): ${unit.subUnit.toString()}\n'),
                Text('OKR id: ${unit.okRsId}'),
                PrimaryButton(
                  context: context,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoute.unitAdd,
                      arguments: unit.id,
                    );
                  },
                  label: 'Thêm unit',
                ),
              ],
            ),
          );
        });
  }
}
