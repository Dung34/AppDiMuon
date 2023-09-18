import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../data/resources/resources.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/utils/dialog_helper.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/line/line_painter.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import 'cubit/event_cubit.dart';

class EventSettingPage extends StatefulWidget {
  const EventSettingPage({super.key});

  @override
  State<EventSettingPage> createState() => _EventSettingPageState();
}

class _EventSettingPageState extends BasePageState<EventSettingPage, EventCubit>
    with AutomaticKeepAliveClientMixin {
  String fromDate = '';
  String toDate = '';
  final TextEditingController _controllerFromTime = TextEditingController();
  final TextEditingController _controllerToTime = TextEditingController();
  final TextEditingController _controllerFromDate = TextEditingController();
  final TextEditingController _controllerToDate = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _controllerFromDate.dispose();
    _controllerToDate.dispose();
    super.dispose();
  }

  void _onCheckinSetting() async {
    List<String> fromTime = _controllerFromTime.text.split(':');
    List<String> toTime = _controllerToTime.text.split(':');
    List<String> fromDate = _controllerFromDate.text.split('-');
    List<String> toDate = _controllerToDate.text.split('-');

    bool status = await cubit.onCheckinSetting(
        '1900-01-01T${fromTime[0].length == 1 ? '0' : ''}${_controllerFromTime.text}:00',
        '1900-01-01T${toTime[0].length == 1 ? '0' : ''}${_controllerToTime.text}:00',
        '${fromDate[2]}-${fromDate[1]}-${fromDate[0]}T00:00:00',
        '${toDate[2]}-${toDate[1]}-${toDate[0]}T00:00:00');

    print(status);

    if (status) {
      showDialog(
          context: context,
          builder: (context) => getErrorDialog(
              context: context,
              message: "Cài đặt thành công",
              icon: Assets.icSuccess));
    } else {
      showDialog(
          context: context,
          builder: (context) => getErrorDialog(
              context: context, message: "Cài đặt không thành công"));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Cài đặt',
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {},
              child: Row(children: [
                SvgPicture.asset(Assets.icPeople2, color: AppColor.third600),
                const Text(
                  '   Danh sách thành viên',
                  style: AppTextTheme.robotoMedium16,
                ),
                const Icon(Icons.edit_outlined,
                    color: AppColor.third600, size: 14.0),
              ]),
            ),
            const SizedBox(height: 16.0),
            const Text('Thời gian làm việc',
                style: AppTextTheme.robotoMedium16),
            const SizedBox(height: 8.0),
            Row(
              children: [
                SizedBox(
                  height: 46.0,
                  width: (context.screenWidth - 56) / 2,
                  child: TextField(
                    controller: _controllerFromTime,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15.0),
                        hintStyle: AppTextTheme.robotoRegular16
                            .copyWith(color: AppColor.primary300),
                        hintText: '8:30',
                        prefixIcon: const Icon(
                          Icons.access_time,
                          size: 17.0,
                        ),
                        prefixIconColor: AppColor.primary300),
                  ),
                ),
                SizedBox(
                  width: 24,
                  child: Center(
                      child: CustomPaint(
                    size: const Size(14, 0.5),
                    painter:
                        LinePainter(color: AppColor.primary500, strokeWidth: 1),
                  )),
                ),
                SizedBox(
                  height: 46.0,
                  width: (context.screenWidth - 56) / 2,
                  child: TextField(
                    controller: _controllerToTime,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15.0),
                        hintStyle: AppTextTheme.robotoRegular16
                            .copyWith(color: AppColor.primary300),
                        hintText: '16:30',
                        prefixIcon: const Icon(
                          Icons.access_time,
                          size: 17.0,
                        ),
                        prefixIconColor: AppColor.primary300),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            const Text('Từ ngày', style: AppTextTheme.robotoMedium16),
            const SizedBox(height: 12.0),
            SizedBox(
              height: 46.0,
              width: (context.screenWidth - 32),
              child: TextField(
                controller: _controllerFromDate,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 15.0),
                    hintStyle: AppTextTheme.robotoRegular16
                        .copyWith(color: AppColor.primary300),
                    hintText: '20-10-1987',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month_outlined,
                          color: AppColor.third600, size: 21.0),
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(3000));

                        if (picked != null) {
                          fromDate = DateFormat('dd-MM-yyyy').format(picked);
                          _controllerFromDate.text =
                              _controllerToDate.text = fromDate;
                        }
                      },
                    ),
                    prefixIconColor: AppColor.primary300),
              ),
            ),
            const SizedBox(height: 12.0),
            const Text('Đến ngày', style: AppTextTheme.robotoMedium16),
            const SizedBox(height: 12.0),
            SizedBox(
              height: 46.0,
              width: (context.screenWidth - 32),
              child: TextField(
                controller: _controllerToDate,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 15.0),
                    hintStyle: AppTextTheme.robotoRegular16
                        .copyWith(color: AppColor.primary300),
                    hintText: '20-10-1987',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month_outlined,
                          color: AppColor.third600, size: 21.0),
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(3000));

                        if (picked != null) {
                          toDate = DateFormat('dd-MM-yyyy').format(picked);
                          _controllerToDate.text = toDate;
                        }
                      },
                    ),
                    prefixIconColor: AppColor.primary300),
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
                context: context,
                onPressed: _onCheckinSetting,
                label: 'Cài đặt'),
          ],
        ),
      ),
    );
  }
}
