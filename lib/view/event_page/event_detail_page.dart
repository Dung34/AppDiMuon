import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes.dart';
import '../../data/constant/constants.dart';
import '../../data/resources/resources.dart';
import '../../shared/etx/view_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/utils/dialog_helper.dart';
import '../../shared/utils/view_utils.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/image/primary_image.dart';
import '../../shared/widgets/something/loading.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import 'cubit/event_cubit.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends BasePageState<EventDetailPage, EventCubit> {
  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  bool get isUseLoading => true;

  @override
  bool get useBlocProviderValue => true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as EventDetailPageArgs;
    setCubit = args.eventCubit;

    cubit.getEventById(args.eventId);
  }

  late final EventDetailPageArgs args;

  @override
  Widget buildPage(BuildContext context) {
    return BlocConsumer<EventCubit, EventState>(
      listener: (context, state) {
        if (state is EventDeleteEventSuccessState) {
          hideLoading();
          ViewUtils.toastSuccess(AlertText.deleteSuccess);
          context.pop();
        }
        if (state is EventDeleteEventFailedState) {
          ViewUtils.toastSuccess(AlertText.deleteFailed);
          hideLoading();
        }
      },
      buildWhen: (previous, current) =>
          current is EventGetEventByIdSuccessState ||
          current is EventGetEventByIdFailedState ||
          current is EventResetState,
      builder: (context, state) {
        if (state is EventGetEventByIdSuccessState) {
          final event = state.event;

          return Scaffold(
            backgroundColor: AppColor.primaryBackgroundColor,
            appBar: PrimaryAppBar(
              title: 'Thông tin chi tiết',
              actions: [
                if (userCubit.currentUser?.role == UserRole.admin)
                  PrimaryIconButton(
                    context: context,
                    onPressed: () => _onEventDeletePressed(context),
                    icon: Assets.icDelete,
                    iconColor: AppColor.error400,
                  ),
                if (userCubit.currentUser?.role == UserRole.admin)
                  PrimaryIconButton(
                    context: context,
                    onPressed: () => _onEventUpdatePressed(context),
                    icon: Assets.icEdit,
                  ),
                if (userCubit.currentUser?.role == UserRole.admin)
                  PrimaryIconButton(
                    context: context,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.eventQr,
                          arguments: EventQrPageArgs(event: event));
                    },
                    icon: Assets.icQrCode,
                  ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: PrimaryNetworkImage(
                          imageUrl: event.background,
                          height: (context.screenWidth - 32) * 9 / 16,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${event.title}',
                        style: AppTextTheme.lexendBold18
                            .copyWith(color: AppColor.primary900),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          PrimaryButton(
                            context: context,
                            onPressed: () {},
                            label: event.statusStr,
                            backgroundColor:
                                event.status == EventStatus.notStarted
                                    ? AppColor.third400
                                    : event.status == EventStatus.begining
                                        ? AppColor.secondary400
                                        : event.status == EventStatus.finished
                                            ? AppColor.fourth600
                                            : AppColor.error400,
                            contentPadding: 8,
                          ),
                          const SizedBox(width: 10),
                          PrimaryButton(
                            context: context,
                            onPressed: () {},
                            icon: event.checked ? Assets.icStar : null,
                            iconColor: AppColor.white,
                            backgroundColor: event.checked
                                ? AppColor.third400
                                : event.status == EventStatus.finished &&
                                        !event.checked
                                    ? AppColor.error400
                                    : AppColor.fourth600,
                            label: event.checked
                                ? 'Đã tham dự'
                                : event.status == EventStatus.finished &&
                                        !event.checked
                                    ? 'Không tham dự'
                                    : 'Chưa tham dự',
                            contentPadding: 8,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(Assets.icClock),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Bắt đầu: ${DateTimeUtils.formatDate(
                                        event.startTime ?? '',
                                        showOnlyTime: true,
                                      )} ${DateTimeUtils.formatDate(event.startTime ?? '')}',
                                      textAlign: TextAlign.start,
                                      style:
                                          AppTextTheme.robotoMedium12.copyWith(
                                        color: AppColor.secondary500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.icLocation),
                                    const SizedBox(width: 4),
                                    Text(
                                      event.location ?? 'Chưa cập nhật',
                                      textAlign: TextAlign.start,
                                      style:
                                          AppTextTheme.robotoMedium12.copyWith(
                                        color: AppColor.secondary500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoute.eventMember,
                                arguments: EventMemberPageArgs(
                                    eventId: event.id ?? ''),
                              );
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(Assets.icPeople),
                                const SizedBox(width: 4),
                                Text(
                                  event.totalUserCount.toString(),
                                  style: AppTextTheme.robotoMedium12
                                      .copyWith(color: AppColor.secondary500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${event.description}',
                        style: AppTextTheme.robotoRegular12.copyWith(
                          color: AppColor.secondary500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is EventGetEventByIdFailedState) {
          return const NoData();
        } else {
          return const Loading();
        }
      },
    );
  }

  _onEventDeletePressed(BuildContext context) async {
    await context.showAppDialog(
      getAlertDialog(
        context: context,
        title: 'Xác nhận',
        message: 'Bạn có chắc chắn muốn xoá buổi học này?',
        onPositivePressed: () {
          showLoading();
          cubit.deleteEvent(args.eventId);
        },
      ),
    );
  }

  _onEventUpdatePressed(BuildContext context) async {
    Navigator.pushNamed(context, AppRoute.eventCreate,
        arguments: CalendarAddPageArgs(
          currentSelectedDate: DateTime.now(),
          eventCubit: cubit,
          isAddNew: false,
          isFromCalendar: args.isFromCalendar,
        ));
  }
}
