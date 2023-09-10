import 'package:flutter/material.dart';

import '../../data/resources/resources.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/something/center_outlined_text_filed.dart';
import '../base/base_page_sate.dart';
import 'cubit/event_cubit.dart';

class EventPageCheckin<EventCubit> extends StatefulWidget {
  const EventPageCheckin({super.key});

  @override
  State<EventPageCheckin> createState() => _EventPageCheckin();
}

class _EventPageCheckin extends BasePageState<EventPageCheckin, EventCubit> {
  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Text(
          'Thống kê check-in tháng ${DateTime.now().month}/${DateTime.now().year}',
          textAlign: TextAlign.center,
          style:
              AppTextTheme.lexendBold18.copyWith(color: AppColor.secondary500),
        ),
        const SizedBox(height: 8.0),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: (context.screenWidth - 32) / 3,
            child: CenterOutlinedTextField(
              enabledTextFieldBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: AppColor.secondary200)),
              focusedTextFieldBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: AppColor.secondary200)),
              label: 'Ngày công',
              labelStyle: AppTextTheme.robotoRegular12
                  .copyWith(color: AppColor.primary500),
              paddingLabel: const EdgeInsets.all(4.0),
              paddingTextField: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: context.screenWidth * 0.015,
                  right: context.screenWidth * 0.015),
              readOnly: true,
              text: '0/0',
              textFieldStyle: AppTextTheme.robotoRegular14,
            ),
          ),
          SizedBox(
            width: (context.screenWidth - 32) / 3,
            child: CenterOutlinedTextField(
              enabledTextFieldBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: AppColor.secondary200)),
              focusedTextFieldBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: AppColor.secondary200)),
              label: 'Đi muộn',
              labelStyle: AppTextTheme.robotoRegular12
                  .copyWith(color: AppColor.primary500),
              paddingLabel: const EdgeInsets.all(4.0),
              paddingTextField: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: context.screenWidth * 0.015,
                  right: context.screenWidth * 0.015),
              readOnly: true,
              text: '0/0',
              textFieldStyle: AppTextTheme.robotoRegular14,
            ),
          ),
          SizedBox(
            width: (context.screenWidth - 32) / 3,
            child: CenterOutlinedTextField(
              enabledTextFieldBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: AppColor.secondary200)),
              focusedTextFieldBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: AppColor.secondary200)),
              label: 'Nghỉ làm',
              labelStyle: AppTextTheme.robotoRegular12
                  .copyWith(color: AppColor.primary500),
              paddingLabel: const EdgeInsets.all(4.0),
              paddingTextField: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: context.screenWidth * 0.015,
                  right: context.screenWidth * 0.015),
              readOnly: true,
              text: '0/0',
              textFieldStyle: AppTextTheme.robotoRegular14,
            ),
          ),
        ]),
        const SizedBox(height: 20),
        Row(
          children: [
            SizedBox(
              width: (context.screenWidth - 48) / 2,
              child: PrimaryButton(
                context: context,
                onPressed: () {},
                label: 'Báo cáo hàng ngày',
                textStyle:
                    AppTextTheme.textButtonPrimary.copyWith(fontSize: 12),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: (context.screenWidth - 48) / 2,
              child: PrimaryButton(
                backgroundColor: AppColor.primary50,
                context: context,
                onPressed: () {},
                label: 'Báo cáo tổng quan',
                textStyle: AppTextTheme.textButtonPrimary
                    .copyWith(color: AppColor.primary500, fontSize: 12),
              ),
            ),
          ],
        )
      ],
    );
  }
}
