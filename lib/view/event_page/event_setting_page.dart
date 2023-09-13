import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../data/resources/resources.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/line/line_painter.dart';
import '../../shared/widgets/something/primary_app_bar.dart';

class EventSettingPage extends StatefulWidget {
  const EventSettingPage({super.key});

  @override
  State<EventSettingPage> createState() => _EventSettingPageState();
}

class _EventSettingPageState extends State<EventSettingPage>
    with AutomaticKeepAliveClientMixin {
  String fromDate = '';
  String toDate = '';
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
                    hintText: '20/10/1987',
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
                          fromDate = DateFormat('dd/MM/yyyy').format(picked);
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
                    hintText: '20/10/1987',
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
                          toDate = DateFormat('dd/MM/yyyy').format(picked);
                          _controllerToDate.text = toDate;
                        }
                      },
                    ),
                    prefixIconColor: AppColor.primary300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
