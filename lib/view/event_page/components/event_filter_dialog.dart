import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/resources/resources.dart';
import '../../../shared/etx/view_ext.dart';
import '../../../shared/widgets/container/primary_container.dart';
import '../calendar/select_date_time_item.dart';
import '../cubit/event_cubit.dart';

// ignore: must_be_immutable
class EventFilterDialog extends StatelessWidget {
  final EventCubit eventCubit;
  const EventFilterDialog({
    super.key,
    required this.eventCubit,
  });

  @override
  Widget build(BuildContext context) {
    final timeFilterData = eventCubit.eventFilterData.timeFilterData;
    final timeRange = eventCubit.eventFilterData.timeRange;
    final statusFilterData = eventCubit.eventFilterData.statusFilterData;

    if (timeFilterData[2]) {
      eventCubit
        ..showFullDay(true)
        ..onCheckRangeDateTime(timeRange[0], timeRange[1]);
    }
    return WillPopScope(
      onWillPop: () async {
        context.pop(timeFilterData[2] ? timeRange : null);
        return false;
      },
      child: BlocProvider.value(
        value: eventCubit,
        child: Scaffold(
          backgroundColor: AppColor.primaryBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Lọc sự kiện',
                      style: AppTextTheme.robotoBold24,
                    ),
                    const SizedBox(height: 20),
                    const Text('Trạng thái', style: AppTextTheme.robotoBold14),
                    const SizedBox(height: 10),
                    GroupFilter(
                      items: const [
                        'Đang diễn ra',
                        'Đã diễn ra',
                        'Sắp diễn ra'
                      ],
                      onChanged: (result) {},
                      initialValue: statusFilterData,
                      checkOnlyOne: true,
                    ),
                    const SizedBox(height: 20),
                    const Text('Trạng thái', style: AppTextTheme.robotoBold14),
                    const SizedBox(height: 10),
                    GroupFilter(
                      items: const ['Gần nhất', 'Xa nhất', 'Khoảng thời gian'],
                      checkOnlyOne: true,
                      onChanged: (result) {
                        if (result[2]) {
                          eventCubit.showFullDay(true);
                        } else {
                          eventCubit.showFullDay(false);
                        }
                      },
                      initialValue: timeFilterData,
                    ),
                    BlocConsumer<EventCubit, EventState>(
                      listener: (context, state) {},
                      buildWhen: (previous, current) =>
                          current is EventShowFullDayState,
                      builder: (context, state) {
                        if (state is EventShowFullDayState && state.isShow) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  const Text('Bắt đầu'),
                                  const Spacer(),
                                  SelectDateTimeItem(
                                    key: UniqueKey(),
                                    intialDateTime: timeRange[0],
                                    onTimeChanged: (dateTime) {
                                      eventCubit.onCheckRangeDateTime(
                                          dateTime, timeRange[1]);
                                    },
                                    onDateChange: (dateTime) {
                                      eventCubit.onCheckRangeDateTime(
                                          dateTime, timeRange[1]);
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Kết thúc'),
                                  const Spacer(),
                                  SelectDateTimeItem(
                                    key: UniqueKey(),
                                    intialDateTime: timeRange[1],
                                    onTimeChanged: (dateTime) {
                                      eventCubit.onCheckRangeDateTime(
                                          timeRange[0], dateTime);
                                    },
                                    onDateChange: (dateTime) {
                                      eventCubit.onCheckRangeDateTime(
                                          timeRange[0], dateTime);
                                    },
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    BlocConsumer<EventCubit, EventState>(
                      listenWhen: (previous, current) {
                        return current is EventCheckedRangeDateTimeState;
                      },
                      listener: (context, state) {
                        if (state is EventCheckedRangeDateTimeState) {
                          timeRange[0] = state.startTime;
                          timeRange[1] = state.endTime;
                        }
                      },
                      buildWhen: (previous, current) =>
                          current is EventCheckedRangeDateTimeState,
                      builder: (context, state) {
                        if (state is EventCheckedRangeDateTimeState &&
                            !state.isSastified) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ngày kết thúc phải lớn hơn ngày bắt đầu',
                                style: AppTextTheme.robotoRegular14
                                    .copyWith(color: AppColor.error400),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GroupFilter extends StatefulWidget {
  final Axis? direction;
  final List<String> items;
  final List<bool> initialValue;
  final bool? checkOnlyOne;

  final Function(List<bool> result) onChanged;

  const GroupFilter(
      {Key? key,
      this.direction,
      required this.items,
      this.checkOnlyOne = false,
      required this.onChanged,
      required this.initialValue})
      : super(key: key);

  @override
  State<GroupFilter> createState() => _GroupFilterState();
}

class _GroupFilterState extends State<GroupFilter> {
  late final List<bool> checkValue;

  @override
  void initState() {
    checkValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: checkValue
          .asMap()
          .entries
          .map(
            (e) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      final newVal = !checkValue[e.key];
                      if (widget.checkOnlyOne!) {
                        for (int i = 0; i < checkValue.length; i++) {
                          checkValue[i] = i == e.key ? newVal : false;
                        }
                      } else {
                        checkValue[e.key] = newVal;
                      }
                      widget.onChanged.call(checkValue);
                    });
                  },
                  child: PrimaryContainer(
                    borderRadius: 20,
                    borderColor: checkValue[e.key]
                        ? AppColor.transparent
                        : AppColor.primaryColor,
                    backgroundColor: checkValue[e.key]
                        ? AppColor.primary100
                        : AppColor.primaryBackgroundColor,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    child: Text(
                      widget.items[e.key],
                      style: AppTextTheme.robotoMedium14,
                    ),
                  ),
                )
              ],
            ),
          )
          .toList(),
    );
  }
}
