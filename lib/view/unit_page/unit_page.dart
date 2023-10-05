import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    Navigator.pushNamed(context, AppRoute.unitAdd);
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
                  current is UnitInitialState,
              builder: (context, state) {
                if (state is UnitGetAllUnitSuccessState) {
                  final units = state.units;

                  if (units.isNotEmpty) {
                    final items = List.generate(units.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UnitItem(unit: units[index]),
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
                }
                return const Center(child: CircularProgressIndicator());
              }),
        )
      ],
    );
  }
}
