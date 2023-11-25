import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/key_result/key_result.dart';
import '../../domain/entity/okr/task/task.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/image/primary_image.dart';
import '../../shared/widgets/something/loading.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/bloc/user/user_cubit.dart';
import '../select_tenant/tenant_cubit/tenant_cubit.dart';
import 'component/task_item.dart';
import 'cubit/okr_cubit.dart';
import 'key_result_add_page.dart';

class KeyResultDetailPage extends StatefulWidget {
  const KeyResultDetailPage({super.key});

  @override
  State<KeyResultDetailPage> createState() => _KeyresultDetailPageState();
}

class _KeyresultDetailPageState extends State<KeyResultDetailPage> {
  late KeyResultDetailPageArgs args;
  List<Task> tasks = [];
  final OkrCubit cubit = OkrCubit();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as KeyResultDetailPageArgs;

    cubit.getAllTask(keyResultId: args.keyResult.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        actions: args.isAdmin
            ? [
                PrimaryIconButton(
                  context: context,
                  icon: Assets.icMenuDot,
                  onPressed: () {},
                ),
              ]
            : null,
        backgroundColor: AppColor.white,
        elevation: 2,
        leading: Row(
          children: [
            const SizedBox(width: 10),
            PrimaryIconButton(
              context: context,
              icon: Icons.arrow_back_ios_rounded,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        leadingWidth: context.screenWidth * 0.093,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${args.keyResult.title}', style: AppTextTheme.lexendBold18),
            Row(
              children: [
                SvgPicture.asset(Assets.icArrowActionForward2),
                const Text(' Key Result ', style: AppTextTheme.lexend),
                Text('from ',
                    style: AppTextTheme.lexendRegular14
                        .copyWith(color: AppColor.gray200)),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('${args.parentObjective}',
                      style: AppTextTheme.lexendBold14),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: AppColor.gray50,
      body: Stack(
        children: [
          Positioned(
              right: -20,
              top: context.screenHeight * 0.09,
              child: Image.asset(Assets.bgKeyResultDetail,
                  height: context.screenHeight * 0.56,
                  width: context.screenWidth * 0.717)),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Detail(keyResult: args.keyResult),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text('TASKS', style: AppTextTheme.lexendBold18),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text('More',
                                  style: AppTextTheme.robotoRegular16
                                      .copyWith(color: AppColor.green400)),
                              const Icon(Icons.arrow_right_outlined)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    BlocProvider(
                      create: (context) => cubit,
                      child: BlocBuilder<OkrCubit, OkrState>(
                          buildWhen: (previous, current) =>
                              current is TaskGetAllTaskSuccessState,
                          builder: (context, state) {
                            if (state is TaskGetAllTaskSuccessState) {
                              tasks = state.taskList;
                            } else {
                              return const Loading();
                            }
                            return tasks.isNotEmpty
                                ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColor.white),
                                    padding: const EdgeInsets.all(10),
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        final task = tasks[index];

                                        return InkWell(
                                          onTap: () {},
                                          child: Column(
                                            children: [
                                              TaskItem(
                                                  task: task, cubit: cubit),
                                              const Divider(
                                                  color: AppColor.gray200,
                                                  height: 16,
                                                  thickness: 0.5),
                                            ],
                                          ),
                                        );
                                      },
                                      itemCount: tasks.length,
                                      shrinkWrap: true,
                                    ),
                                  )
                                : const NoData();
                          }),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  _onCreateKeyResultPressed(String okrsId, String objectiveId) {
    context.showAppBottomSheet(KeyResultAddPage(
      cubit: cubit,
      okrsId: okrsId,
      objectiveId: objectiveId,
    ));
  }
}

class Detail extends StatefulWidget {
  final KeyResult keyResult;

  const Detail({super.key, required this.keyResult});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final TenantCubit tenantCubit = TenantCubit();
  final UserCubit userCubit = UserCubit();

  @override
  void initState() {
    super.initState();

    userCubit.getUserById(userId: widget.keyResult.createdBy);
    tenantCubit.getPositionForUser(widget.keyResult.createdBy);
  }

  @override
  Widget build(BuildContext context) {
    String? name;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                color: AppColor.black.withOpacity(0.1),
                offset: const Offset(1, 1),
                spreadRadius: 1)
          ],
          color: AppColor.white),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BlocProvider(
                  create: (context) => userCubit,
                  child: BlocConsumer<UserCubit, UserState>(
                      listener: (context, state) {
                        if (state is UserGetUserSuccessState) {
                          name = state.userEntity.fullName;
                        }
                      },
                      builder: (context, state) =>
                          state is UserGetUserSuccessState
                              ? PrimaryNetworkImage(
                                  height: 46,
                                  imageUrl: "${state.userEntity.avatar}",
                                  width: 46)
                              : Container())),
              BlocProvider(
                create: (context) => tenantCubit,
                child: BlocBuilder<TenantCubit, TenantState>(
                  buildWhen: (previous, current) =>
                      current is GetPositionForUserSuccessState,
                  builder: (context, state) {
                    return (state is GetPositionForUserSuccessState)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text('$name',
                                    style: AppTextTheme.lexendBold16
                                        .copyWith(color: AppColor.darkGray)),
                                SizedBox(
                                  width: context.screenWidth * 0.7,
                                  child: Text(
                                    '${state.claim.department}     ID: ${widget.keyResult.createdBy}}',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextTheme.lexendLight14,
                                  ),
                                )
                              ])
                        : Container();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start Date', style: AppTextTheme.lexendLight14),
                  SizedBox(height: 4),
                  Text('End Date', style: AppTextTheme.lexendLight14),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      DateTimeUtils.formatDate(
                          widget.keyResult.createdDate ?? '',
                          showTime: false),
                      style: AppTextTheme.lexendRegular14),
                  const SizedBox(height: 4),
                  Text(
                      DateTimeUtils.formatDate(widget.keyResult.dueDate ?? '',
                          showTime: false),
                      style: AppTextTheme.lexendRegular14),
                ],
              )),
              const SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}
