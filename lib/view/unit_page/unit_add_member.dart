import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/resources/resources.dart';
import '../../domain/entity/user/user.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/list_view/animation_listview.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import 'component/user_item.dart';
import 'cubit/unit_cubit.dart';

class UnitAddMember extends StatefulWidget {
  final String? parrentId;

  const UnitAddMember({super.key, this.parrentId});

  @override
  State<UnitAddMember> createState() => _UnitAddMember();
}

class _UnitAddMember extends BasePageState<UnitAddMember, UnitCubit> {
  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  void initState() {
    super.initState();
    cubit.getAllUser(unitId: widget.parrentId);
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
            onPressed: () {},
          )
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
                    return UserItem(user: users[index]);
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
