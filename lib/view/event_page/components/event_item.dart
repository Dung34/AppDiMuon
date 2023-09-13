import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes.dart';
import '../../../data/resources/resources.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../../shared/etx/view_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/button/primary_icon_button.dart';
import '../../../shared/widgets/button/secondary_button.dart';
import '../../../shared/widgets/image/primary_image.dart';
import '../../base/base_page_sate.dart';
import '../cubit/event_cubit.dart';

// ignore: must_be_immutable
class EventItem extends StatefulWidget {
  final Event event;
  final bool inCheckInPage;

  const EventItem({
    super.key,
    required this.event,
    this.inCheckInPage = false,
  });

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends BasePageState<EventItem, EventCubit> {
  late int hasOccurred;

  void _onJoinInPressed() async {
    await cubit.joinInEvent(widget.event.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    hasOccurred = DateTime.now().isBefore(
            DateTime.tryParse(widget.event.startDate ?? '') ?? DateTime.now())
        ? -1
        : (DateTime.now().isBefore(
                DateTime.tryParse(widget.event.endDate ?? '') ?? DateTime.now())
            ? 0
            : 1);

    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.0, color: AppColor.primary50))),
      padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: PrimaryNetworkImage(
            imageUrl: widget.event.background,
            height: context.screenWidth * 0.156,
            width: context.screenWidth * 0.156,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${DateTimeUtils.formatDate(widget.event.startDate ?? '')} - ${DateTimeUtils.formatDate(widget.event.endDate ?? '')}',
              style: AppTextTheme.robotoRegular12.copyWith(fontSize: 10),
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
                width: context.screenWidth * 0.68,
                child: Text(
                  widget.event.title ?? '',
                  style: AppTextTheme.robotoMedium16,
                )),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                SecondaryButton(
                  backgroundColor: hasOccurred == 1
                      ? AppColor.red
                      : hasOccurred == 0
                          ? AppColor.green
                          : AppColor.secondary500,
                  context: context,
                  height: 18,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Text(
                    hasOccurred == 0
                        ? 'Đang diễn ra'
                        : hasOccurred == -1
                            ? 'Sắp diễn ra'
                            : 'Đã kết thúc',
                    style: AppTextTheme.robotoBold14
                        .copyWith(fontSize: 12, color: AppColor.white),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                BlocBuilder<EventCubit, EventState>(
                    buildWhen: (previous, current) =>
                        current is EventGetAllEventSuccessState ||
                        current is EventGetEventByFilterSuccessState ||
                        current is EventJoinInEventSucessState,
                    builder: (event, state) {
                      return SecondaryButton(
                        backgroundColor: AppColor.secondary50,
                        context: context,
                        height: 18.0,
                        onPressed:
                            (widget.event.isJoin == 0 && hasOccurred != 1)
                                ? () async {
                                    _onJoinInPressed();
                                  }
                                : () {},
                        padding: EdgeInsets.zero,
                        child: (state is EventGetAllEventSuccessState ||
                                state is EventGetEventByFilterSuccessState ||
                                state is EventJoinInEventSucessState)
                            ? Text(
                                widget.event.isJoin == 1
                                    ? 'Đã tham gia'
                                    : 'Tham gia ngay',
                                style: AppTextTheme.robotoMedium12
                                    .copyWith(color: AppColor.primary500))
                            : Text(
                                'Đã tham gia',
                                style: AppTextTheme.robotoMedium12
                                    .copyWith(color: AppColor.primary500),
                              ),
                      );
                    }),
              ],
            ),
          ],
        ),
        const Spacer(),
        PrimaryIconButton(
            context: context,
            icon: Icons.arrow_circle_right_outlined,
            iconColor: AppColor.third600,
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.eventDetail,
                  arguments: EventDetailPageArgs(
                    eventId: widget.event.id!,
                    eventCubit: context.read<EventCubit>(),
                    isFromCalendar: false,
                  ));
            })
      ]),
    );
  }
}
