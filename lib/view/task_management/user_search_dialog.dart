import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/resources/resources.dart';
import '../../../shared/etx/view_ext.dart';
import '../../../shared/widgets/container/primary_container.dart';
import '../../../shared/widgets/image/primary_circle_image.dart';
import '../../../shared/widgets/text_field/primary_search_text_field.dart';
import '../../domain/entity/user/user.dart';
import '../../shared/widgets/list_view/primary_paged_list_view.dart';
import '../base/base_page_sate.dart';
import '../okr_page/cubit/okr_cubit.dart';

class UserSearchDialog extends StatefulWidget {
  const UserSearchDialog({super.key});

  @override
  State<UserSearchDialog> createState() => _UserSearchDialogState();
}

class _UserSearchDialogState extends BasePageState<UserSearchDialog, OkrCubit> {
  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      cubit.getAllUsers(
          page: pageKey, unitId: 'c48d7f37-8311-4741-911f-5e259ef22603');
    });
  }

  final PagingController<int, UserEntity> pagingController =
      PagingController(firstPageKey: 1);

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        PrimarySearchTextField(
          // autoFocus: true,
          label: '',
          hintText: 'Tìm kiếm',
          controller: TextEditingController(),
          onChanged: (value) {
            cubit.getAllUsers(page: 1);
          },
        ),
        const SizedBox(height: 10),
        Expanded(
          child: BlocListener<OkrCubit, OkrState>(
            listener: (context, state) {
              if (state is OkrGetAllUserSuccessState) {
                if (state.users.length > 10) {
                  pagingController.appendPage(
                      state.users, pagingController.nextPageKey! + 1);
                } else {
                  pagingController.appendLastPage(state.users);
                }
              }
            },
            child: PrimaryPagedListView(
                itemBuilder: (context, item, index) {
                  final user = item;
                  return InkWell(
                    onTap: () {
                      context.pop(user);
                    },
                    child: PrimaryContainer(
                      borderColor: AppColor.gray,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      borderWidth: 0.5,
                      child: Row(
                        children: [
                          PrimaryCircleImage(
                            imageUrl: user.avatar ?? '',
                            radius: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.fullName ?? '',
                                  style: AppTextTheme.robotoBold14.copyWith(
                                    color: AppColor.green300,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Điện thoại: ${user.phoneNumber ?? 'Chưa cập nhật'}',
                                  style: AppTextTheme.robotoBold14,
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                pagingController: pagingController,
                onRefresh: () {
                  pagingController.refresh();
                }),
          ),
        ),
      ],
    );
  }
}
