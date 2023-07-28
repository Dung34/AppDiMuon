import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/resources/resources.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/container/primary_container.dart';

class SelectDateTimeItem extends StatefulWidget {
  final String intialDateTime;
  final DateTime? minimumDateTime;
  final DateTime? maximumDateTime;
  final bool showTime;
  final Function(String dateTime) onTimeChanged;
  final Function(String dateTime) onDateChange;
  const SelectDateTimeItem({
    super.key,
    required this.intialDateTime,
    required this.onTimeChanged,
    required this.onDateChange,
    this.minimumDateTime,
    this.maximumDateTime,
    this.showTime = true,
  });

  @override
  State<SelectDateTimeItem> createState() => _SelectDateTimeItemState();
}

class _SelectDateTimeItemState extends State<SelectDateTimeItem> {
  Duration? initialTime;
  late String selectedDateTime;
  @override
  void initState() {
    selectedDateTime = widget.intialDateTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.showTime)
          TextButton(
            onPressed: () {
              context
                  .showAppBottomSheet(Wrap(
                children: [
                  Container(
                    color: AppColor.primaryBackgroundColor,
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.hm,
                      initialTimerDuration: initialTime ??
                          Duration(
                            hours: DateTime.now().hour,
                            minutes: DateTime.now().minute,
                          ),
                      onTimerDurationChanged: (value) {
                        initialTime = Duration(
                          minutes: value.inMinutes,
                        );
                        final d = DateTimeUtils.toDateTime(selectedDateTime);
                        selectedDateTime = DateTime(
                                d.year,
                                d.month,
                                d.day,
                                value.inHours,
                                value.inMinutes - value.inHours * 60)
                            .toIso8601String();
                      },
                    ),
                  ),
                ],
              ))
                  .then((value) {
                widget.onTimeChanged.call(selectedDateTime);
                setState(() {});
              });
            },
            child: PrimaryContainer(
              backgroundColor: AppColor.fourth200,
              padding: const EdgeInsets.all(12),
              child: Text(
                DateTimeUtils.formatDate(
                  selectedDateTime,
                  showOnlyTime: true,
                ),
              ),
            ),
          ),
        TextButton(
          onPressed: () {
            context
                .showAppBottomSheet(Container(
              color: AppColor.primaryBackgroundColor,
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: SizedBox(
                height: 400,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTimeUtils.toDateTime(selectedDateTime),
                  onDateTimeChanged: (value) {
                    final d = DateTimeUtils.toDateTime(selectedDateTime);
                    selectedDateTime = DateTime(value.year, value.month,
                            value.day, d.hour, d.minute)
                        .toIso8601String();
                  },
                ),
              ),
            ))
                .then((value) {
              widget.onDateChange.call(selectedDateTime);
              setState(() {});
            });
          },
          child: PrimaryContainer(
            backgroundColor: AppColor.fourth200,
            padding: const EdgeInsets.all(12),
            child: Text(
              DateTimeUtils.formatDate(
                selectedDateTime,
              ),
            ),
          ),
        )
      ],
    );
  }
}
