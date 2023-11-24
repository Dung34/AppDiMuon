import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/key_result/key_result.dart';
import '../../domain/entity/okr/objective/objective.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/image/primary_image.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import 'component/key_result_item.dart';
import 'cubit/okr_cubit.dart';
import 'key_result_add_page.dart';

class KeyResultDetailPage extends StatefulWidget {
  const KeyResultDetailPage({super.key});

  @override
  State<KeyResultDetailPage> createState() => _KeyresultDetailPageState();
}

class _KeyresultDetailPageState extends State<KeyResultDetailPage> {
  late OkrCubit cubit;
  late KeyResultDetailPageArgs args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as KeyResultDetailPageArgs;
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
                Text('${args.parentObjective}',
                    style: AppTextTheme.lexendBold14)
              ],
            )
          ],
        ),
      ),
      backgroundColor: AppColor.gray50,
      body: Stack(children: [
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
                Container(
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
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PrimaryNetworkImage(
                              height: 46, imageUrl: '', width: 46),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tạm thời API chưa sửa xong',
                                    style: AppTextTheme.lexendBold16
                                        .copyWith(color: AppColor.darkGray)),
                                SizedBox(
                                  width: context.screenWidth * 0.7,
                                  child: Text(
                                    'Project manager     ID: Tạm thời API chưa sửa xong',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextTheme.lexendLight14,
                                  ),
                                )
                              ]),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Start Date',
                                  style: AppTextTheme.lexendLight14),
                              SizedBox(height: 4),
                              Text('End Date',
                                  style: AppTextTheme.lexendLight14),
                              SizedBox(height: 4),
                              Text('Target', style: AppTextTheme.lexendLight14)
                            ],
                          )),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tạm thời API chưa sửa xong',
                                  style: AppTextTheme.lexendRegular14),
                              const SizedBox(height: 4),
                              Text('Tạm thời API chưa sửa xong',
                                  style: AppTextTheme.lexendRegular14),
                              const SizedBox(height: 4),
                              Text('Tạm thời API chưa sửa xong',
                                  style: AppTextTheme.lexendRegular14)
                            ],
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text('SCORE', style: AppTextTheme.lexendBold18),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ]),
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

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(blurRadius: 1, offset: Offset(1, 1), spreadRadius: 1)
          ],
          color: AppColor.white),
    );
  }
}

class Score extends StatelessWidget {
  final Objective objective;

  const Score({super.key, required this.objective});
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: context.screenWidth),
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
      child: Column(children: [
        CircularPercentIndicator(
          center: Text('...%', style: AppTextTheme.robotoBold18),
          lineWidth: 9,
          percent: 0.6,
          progressColor: AppColor.green200,
          radius: 53,
        ),
        const SizedBox(height: 12),
        Text('PROCESSING',
            style:
                AppTextTheme.robotoBold16.copyWith(color: AppColor.green200)),
        const SizedBox(height: 6),
        Text(
          '${objective.description}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextTheme.robotoLight14,
        ),
        const SizedBox(height: 16),
      ]),
    );
  }
}
