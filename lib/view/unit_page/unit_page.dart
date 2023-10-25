import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/unit/unit.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/list_view/animation_listview.dart';
import '../../shared/widgets/something/no_data.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/user/user_cubit.dart';
import 'component/unit_item.dart';
import 'cubit/unit_cubit.dart';

class UnitPage extends StatefulWidget {
  const UnitPage({super.key});

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends BasePageState<UnitPage, UnitCubit> {
  final ScrollController scrollController = ScrollController();

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  void initState() {
    super.initState();
    cubit.getAllUnit();
    userCubit.getUser();
  }

  @override
  Widget buildPage(BuildContext context) {
    List<Unit> units = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 5, color: AppColor.fourth300)),
            color: AppColor.white,
          ),
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) => Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state is UserGetUserSuccessState
                          ? state.userEntity.fullName ?? ' '
                          : ' ',
                      style: AppTextTheme.robotoBold16
                          .copyWith(color: AppColor.green400),
                    ),
                    Text(
                      'ID: ${state is UserGetUserSuccessState ? state.userEntity.id : ''}',
                      style: AppTextTheme.robotoLight12,
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(width: 5.0),
                PrimaryIconButton(
                  context: context,
                  icon: Assets.icAdd,
                  iconColor: AppColor.primary500,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.unitAdd,
                        arguments: UnitAddPageArgs(cubit: cubit));
                  },
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        const Row(
          children: [
            SizedBox(width: 10.0),
            Text('Your Units', style: AppTextTheme.lexendBold24),
          ],
        ),
        const SizedBox(height: 12.0),
        Expanded(
          child: BlocBuilder<UnitCubit, UnitState>(
              buildWhen: (previous, current) =>
                  current is UnitGetAllUnitSuccessState ||
                  current is UnitCreateUnitSuccessState ||
                  current is UnitInitialState ||
                  current is UnitDeleteUnitSuccessState ||
                  current is UnitUpdateUnitSuccessState,
              builder: (context, state) {
                if (state is UnitGetAllUnitSuccessState) {
                  units = state.units;
                } else if (state is UnitCreateUnitSuccessState) {
                  units.add(state.unit);
                } else if (state is UnitDeleteUnitSuccessState) {
                  units.removeWhere((element) => element.id == state.unitId);
                } else if (state is UnitUpdateUnitSuccessState) {
                  units.removeWhere((element) => element.id == state.unit.id);
                  units.add(state.unit);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }

                if (units.isNotEmpty) {
                  final items = List.generate(units.length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UnitItem(unit: units[index], cubit: cubit),
                        const SizedBox(height: 24),
                      ],
                    );
                  });
                  return AnimationStaggeredListView(
                    items: items,
                    onRefresh: () async {
                      cubit.getAllUnit();
                    },
                  );
                } else {
                  return const NoData();
                }
              }),
        )
      ],
    );
  }
}
