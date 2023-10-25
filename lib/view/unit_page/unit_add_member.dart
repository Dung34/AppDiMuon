import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/resources/resources.dart';
import '../../domain/entity/okr/unit/unit.dart';
import '../../domain/entity/user/user.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import 'component/user_item.dart';
import 'cubit/unit_cubit.dart';

class UnitAddMember extends StatefulWidget {
  final Unit unit;
  final UnitCubit cubit;

  const UnitAddMember({super.key, required this.unit, required this.cubit});

  @override
  State<UnitAddMember> createState() => _UnitAddMember();
}

class _UnitAddMember extends BasePageState<UnitAddMember, UnitCubit> {
  List<UserEntity> members = [];

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  bool get useBlocProviderValue => true;

  @override
  void initState() {
    super.initState();

    setCubit = widget.cubit;

    cubit.getAllUser(unitId: widget.unit.parrentId);
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Thêm thành viên',
        actions: [
          PrimaryIconButton(
            context: context,
            icon: Assets.icPeople,
            onPressed: () {
              cubit.addUsersInUnit(widget.unit.id ?? '', members);
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      backgroundColor: AppColor.gray50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: BlocBuilder<UnitCubit, UnitState>(
            buildWhen: (previous, current) =>
                current is UnitGetAllUserInUnitSuccessState,
            builder: (context, state) {
              List<UserEntity> users = [];
              if (state is UnitGetAllUserInUnitSuccessState) {
                users = state.users;
              }

              if (users.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return UserItem(
                      user: users[index],
                      cubit: cubit,
                      members: members,
                    );
                  },
                  itemCount: users.length,
                );
              } else {
                return const NoData();
              }
            },
          ))
        ],
      ),
    );
  }
}
