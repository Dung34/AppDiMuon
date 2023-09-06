import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../config/routes.dart';
import '../../data/constant/constants.dart';
import '../../data/resources/resources.dart';
import '../../shared/etx/view_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/utils/dialog_helper.dart';
import '../../shared/utils/view_utils.dart';
import '../../shared/widgets/button/primary_group_radio_button.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/button/secondary_button.dart';
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
                    // onPressed: () => _onEventDeletePressed(context),
                    onPressed: () {},
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
                PrimaryIconButton(
                  context: context,
                  onPressed: () {},
                  icon: Assets.icSearch,
                ),
                const SizedBox(width: 5.0),
                PrimaryIconButton(
                  context: context,
                  onPressed: () {},
                  icon: Assets.icNotification,
                ),
                const SizedBox(width: 5.0),
              ],
              leading: IconButton(
                color: AppColor.black,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // appBar: AppBar(
            //   actions: [
            //     PrimaryIconButton(
            //       context: context,
            //       onPressed: () {},
            //       icon: Assets.icSearch,
            //     ),
            //     const SizedBox(width: 5.0),
            //     PrimaryIconButton(
            //       context: context,
            //       onPressed: () {},
            //       icon: Assets.icNotification,
            //     )
            //   ],
            //   backgroundColor: AppColor.primaryBackgroundColor,
            //   leading: IconButton(
            //     icon: const Icon(Icons.arrow_back),
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //   ),
            //   title: const Text(
            //     'Thông tin chi tiết',
            //     style: AppTextTheme.lexendBold24,
            //   ),
            // ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider.builder(
                        itemCount: 1,
                        itemBuilder: (context, index, realIndex) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: PrimaryNetworkImage(
                              imageUrl: event.background,
                              height: (context.screenWidth - 32) * 9 / 16,
                              width: double.infinity,
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 150,
                          onPageChanged: (index, reason) {
                            setState(() {});
                          },
                          viewportFraction: 1,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: 1,
                          count: 1,
                          effect: SlideEffect(
                            activeDotColor: AppColor.primary500,
                            dotColor: AppColor.primary100,
                            dotHeight: 5,
                            dotWidth: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SecondaryButton(
                        backgroundColor: event.status == EventStatus.notStarted
                            ? AppColor.secondary500
                            : event.status == EventStatus.begining
                                ? AppColor.secondary500
                                : event.status == EventStatus.finished
                                    ? AppColor.fourth600
                                    : AppColor.error400,
                        context: context,
                        height: 18,
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        child: Text(
                          event.status == 1
                              ? 'Đang diễn ra'
                              : event.status == 2
                                  ? 'Sắp diễn ra'
                                  : 'Đã diễn ra',
                          style: AppTextTheme.robotoMedium12
                              .copyWith(color: AppColor.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${event.title}',
                        style: AppTextTheme.lexendBold18
                            .copyWith(color: AppColor.secondary500),
                      ),
                      const SizedBox(height: 16),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Thời gian: ',
                            style: AppTextTheme.robotoRegular14
                                .copyWith(color: AppColor.secondary500)),
                        TextSpan(
                            text:
                                '${DateTimeUtils.formatDate(event.startDate ?? '')} - ${DateTimeUtils.formatDate(event.endDate ?? '?')}',
                            style: AppTextTheme.robotoRegular14
                                .copyWith(color: AppColor.primary500))
                      ])),
                      const SizedBox(height: 6.0),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Địa điểm: ',
                            style: AppTextTheme.robotoRegular14
                                .copyWith(color: AppColor.secondary500)),
                        TextSpan(
                            text: event.location ?? 'Chưa cập nhật',
                            style: AppTextTheme.robotoRegular14
                                .copyWith(color: AppColor.primary500))
                      ])),
                      const SizedBox(
                        height: 6.0,
                      ),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Số lượng: ',
                            style: AppTextTheme.robotoRegular14
                                .copyWith(color: AppColor.secondary500)),
                        TextSpan(
                            text: '${event.quantity} người',
                            style: AppTextTheme.robotoRegular14
                                .copyWith(color: AppColor.primary500))
                      ])),
                      const SizedBox(height: 10),
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(
                      //       context,
                      //       AppRoute.eventMember,
                      //       arguments: EventMemberPageArgs(
                      //           eventId: event.id ?? ''),
                      //     );
                      //   },
                      //   child: Row(
                      //     children: [
                      //       SvgPicture.asset(Assets.icPeople),
                      //       const SizedBox(width: 4),
                      //       Text(
                      //         event.totalUserCount.toString(),
                      //         style: AppTextTheme.robotoMedium12
                      //             .copyWith(color: AppColor.secondary500),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SecondaryButton(
                        context: context,
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        child: const Row(children: [
                          Icon(
                            Icons.qr_code_rounded,
                            color: AppColor.third600,
                          ),
                          Text(' Quét mã QR'),
                        ]),
                      ),
                      PrimaryGroupRadioButton(
                        activeColor: AppColor.third600,
                        flex: const <int>[3, 5],
                        items: const ['Admin quét', 'Người dùng quét'],
                        onChanged: (value) {},
                        style: AppTextTheme.robotoRegular14,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(color: AppColor.fourth300))),
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                          '${event.description}',
                          style: AppTextTheme.robotoRegular14.copyWith(
                            color: AppColor.primary500,
                          ),
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

  // _onEventDeletePressed(BuildContext context) async {
  //   await context.showAppDialog(
  //     getAlertDialog(
  //       context: context,
  //       title: 'Xác nhận',
  //       message: 'Bạn có chắc chắn muốn xoá buổi học này?',
  //       onPositivePressed: () {
  //         showLoading();
  //         cubit.deleteEvent(args.eventId);
  //       },
  //     ),
  //   );
  // }

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
