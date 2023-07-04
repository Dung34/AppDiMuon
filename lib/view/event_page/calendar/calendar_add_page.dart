import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/resources/resources.dart';
import '../../../shared/utils/validation_utils.dart';
import '../../../shared/widgets/something/primary_app_bar.dart';
import '../../../shared/widgets/switch/primary_switch.dart';
import '../../../shared/widgets/text_field/primary_text_field.dart';
import '../../base/base_page_sate.dart';
import '../cubit/event_cubit.dart';

class CalendarAddPage extends StatefulWidget {
  final EventCubit eventCubit;
  const CalendarAddPage({super.key, required this.eventCubit});

  @override
  State<CalendarAddPage> createState() => _CalendarAddPageState();
}

class _CalendarAddPageState extends BasePageState<CalendarAddPage, EventCubit> {
  @override
  bool get useBlocProviderValue => true;

  @override
  bool get isUseLoading => true;

  @override
  EventCubit get cubit => widget.eventCubit;

  @override
  PreferredSizeWidget? get appBar => PrimaryAppBar(
        centerTitle: true,
        title: 'Tạo sự kiện',
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Thêm',
                style: AppTextTheme.robotoBold16,
              ))
        ],
      );

  final TextEditingController titleController = TextEditingController();
  final titleFormKey = GlobalKey<FormState>();
  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PrimaryTextField(
            formKey: titleFormKey,
            controller: TextEditingController(),
            border: InputBorder.none,
            hintText: 'Thêm tiêu đề',
            inputTextStyle: AppTextTheme.robotoMedium24,
            textInputAction: TextInputAction.newline,
            hintTextStyle:
                AppTextTheme.robotoLight24.copyWith(color: AppColor.fourth700),
            isRequired: true,
            validator: ValidationUtils.textEmptyValidator,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SvgPicture.asset(Assets.icClock),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Cả ngày',
                style: AppTextTheme.robotoRegular16,
              ),
              const Spacer(),
              PrimarySwitch(
                onToggle: (value) {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SvgPicture.asset(Assets.icLocation),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Địa điểm',
                style: AppTextTheme.robotoRegular16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
