// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../config/routes.dart';
// import '../../data/constant/constants.dart';
// import '../../data/resources/resources.dart';
// import '../../domain/entity/event/event_wrapper/event.dart';
// import '../../shared/etx/view_ext.dart';
// import '../../shared/utils/date_time_utils.dart';
// import '../../shared/utils/validation_utils.dart';
// import '../../shared/utils/view_utils.dart';
// import '../../shared/widgets/dropdown/base_dropdown_value.dart';
// import '../../shared/widgets/dropdown/primary_drop_down_form_field.dart';
// import '../../shared/widgets/image/primary_reorder_grid_image.dart';
// import '../../shared/widgets/something/primary_app_bar.dart';
// import '../../shared/widgets/switch/primary_switch.dart';
// import '../../shared/widgets/text_field/primary_text_field.dart';
// import '../base/base_page_sate.dart';
// import '../base/bloc/get_image/get_image_bloc.dart';
// import 'cubit/event_cubit.dart';
// import 'calendar/select_date_time_item.dart';

// class CalendarAddPage extends StatefulWidget {
//   /// if current selected date == event.startDate -> when add a new event successfully, fetch event of this date again

//   const CalendarAddPage({super.key});

//   @override
//   State<CalendarAddPage> createState() => _CalendarAddPageState();
// }

// class _CalendarAddPageState extends BasePageState<CalendarAddPage, EventCubit>
//     with SingleTickerProviderStateMixin {
//   @override
//   bool get useBlocProviderValue => true;

//   @override
//   bool get isUseLoading => true;

//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController locationController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final titleFormKey = GlobalKey<FormState>();
//   final statusDropdownValue = [
//     const BaseDropdownValue(
//       id: '0',
//       valueStr: EventStatusStr.notStarted,
//     ),
//     const BaseDropdownValue(
//       id: '1',
//       valueStr: EventStatusStr.begining,
//     ),
//     const BaseDropdownValue(
//       id: '2',
//       valueStr: EventStatusStr.finished,
//     ),
//     const BaseDropdownValue(
//       id: '3',
//       valueStr: EventStatusStr.canceled,
//     ),
//   ];
//   late BaseDropdownValue statusInitialData;
//   final GetImageBloc getImageBloc = GetImageBloc();
//   late final CalendarAddPageArgs args;

//   @override
//   void initState() {
//     statusInitialData = statusDropdownValue.first;
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     args = context.arguments as CalendarAddPageArgs;
//     currentSelectedDate = args.currentSelectedDate;
//     eventCubit = args.eventCubit;
//     setCubit = eventCubit;
//     // initialize the eventUpdate object with the current selected event in the previous page;
//     if (!args.isAddNew) {
//       event = eventCubit.currentSelectedEvent.copyWith();
//       titleController.text = event.title ?? '';
//       locationController.text = event.location ?? '';
//       descriptionController.text = event.description ?? '';
//       statusInitialData = statusDropdownValue
//           .where((element) => int.parse(element.id!) == event.status)
//           .first;
//     } else {
//       event = Event(
//         startDate: DateTime.now().toIso8601String(),
//         endDate: DateTime.now().toIso8601String(),
//         status: int.parse(statusInitialData.id!),
//       );
//     }

//     setAppBar = PrimaryAppBar(
//       // centerTitle: true,
//       title: args.isAddNew ? 'Tạo lớp học' : 'Chỉnh sửa lớp học',
//       actions: [
//         TextButton(
//             onPressed: _onSave,
//             child: Text(
//               args.isAddNew ? 'Thêm' : 'Lưu',
//               style: AppTextTheme.robotoBold16
//                   .copyWith(color: AppColor.primaryColor),
//             ))
//       ],
//     );
//     cubit.showFullDay(false);
//   }

//   late final DateTime currentSelectedDate;
//   late final EventCubit eventCubit;
//   late final Event event;

//   @override
//   Widget buildPage(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           PrimaryTextField(
//             formKey: titleFormKey,
//             controller: titleController,
//             border: InputBorder.none,
//             hintText: 'Thêm tiêu đề',
//             inputTextStyle: AppTextTheme.robotoMedium24,
//             textInputAction: TextInputAction.newline,
//             maxLength: 100,
//             hintTextStyle:
//                 AppTextTheme.robotoLight24.copyWith(color: AppColor.fourth700),
//             isRequired: true,
//             validator: ValidationUtils.textEmptyValidator,
//           ),
//           const Divider(),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             'Banner',
//             style: AppTextTheme.robotoBold16,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           BlocProvider(
//             create: (context) => getImageBloc,
//             child: BlocListener<GetImageBloc, GetImageState>(
//               listener: (context, state) {
//                 if (state is GetImageGetMultiImageUrlSuccessState) {
//                   event.background = state.imageData[0].data.toString();
//                   if (args.isAddNew) {
//                     cubit.addEvent(event);
//                   } else {
//                     cubit.updateEvent(event);
//                   }
//                 }
//               },
//               child: PrimaryReorderGridImage(
//                 initialData: args.isAddNew
//                     ? const []
//                     : event.background == null
//                         ? const []
//                         : [event.background!],
//                 getImageBloc: getImageBloc,
//                 maxQuantity: 1,
//                 childAspectRatio: 16 / 9,
//                 fit: BoxFit.cover,
//                 onDataChanged: (imageData) {
//                   if (imageData[0].type == ImageDataType.addNew) {
//                     event.background = null;
//                   }
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Divider(),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             'Trạng thái',
//             style: AppTextTheme.robotoBold16,
//           ),
//           const SizedBox(height: 10),
//           SizedBox(
//             width: context.screenWidth / 2,
//             child: PrimaryDropDownFormField(
//               controller: TextEditingController(),
//               items: statusDropdownValue,
//               initialValue: statusInitialData,
//               onChanged: (value) {
//                 event.status = int.parse(value.id!);
//               },
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Divider(),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             'Thời gian',
//             style: AppTextTheme.robotoBold16,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               SvgPicture.asset(Assets.icClock),
//               const SizedBox(width: 10),
//               const Text('Cả ngày', style: AppTextTheme.robotoRegular16),
//               const Spacer(),
//               PrimarySwitch(
//                 initialValue: false,
//                 onToggle: (value) {
//                   cubit.showFullDay(value);
//                   final startTimeDateTime =
//                       DateTimeUtils.toDateTime(event.startTime!);
//                   final endTimeDateTime =
//                       DateTimeUtils.toDateTime(event.endTime!);
//                   event.startTime = DateTime(
//                     startTimeDateTime.year,
//                     startTimeDateTime.month,
//                     startTimeDateTime.day,
//                     0,
//                     0,
//                   ).toIso8601String();
//                   event.endTime = DateTime(
//                     endTimeDateTime.year,
//                     endTimeDateTime.month,
//                     endTimeDateTime.day,
//                     23,
//                     59,
//                   ).toIso8601String();
//                   cubit.onCheckRangeDateTime(event.startTime!, event.endTime!);
//                 },
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           BlocConsumer<EventCubit, EventState>(
//             listener: (context, state) {
//               if (state is EventAddEventSuccessState) {
//                 hideLoading();
//                 context.pop();
//                 ViewUtils.toastSuccess('Thêm sự kiện thành công!');
//                 final eventStartDateTime =
//                     DateTimeUtils.toDateTime(state.event.startTime ?? '');
//                 if (DateUtils.isSameDay(
//                     eventStartDateTime, currentSelectedDate)) {
//                   eventCubit.getAllEvent(
//                       date: eventStartDateTime.toIso8601String());
//                 }

//                 // get all event in month to show marker in calendar
//                 final today = DateTime.now();
//                 eventCubit.getAllCalendarEvent(
//                     startDate:
//                         DateTime(today.year, today.month, -7).toIso8601String(),
//                     endDate: DateTime(today.year, today.month, 37)
//                         .toIso8601String());
//               }
//               if (state is EventAddEventFailedState) {
//                 ViewUtils.toastSuccess('Thêm sự kiện thất bại!');
//                 hideLoading();
//               }
//               if (state is EventUpdateEventSuccessState) {
//                 hideLoading();
//                 context.pop();
//                 cubit.rebuildEventDetail(state.event);
//                 ViewUtils.toastSuccess('Cập nhật sự kiện thành công!');
//                 final eventStartDateTime =
//                     DateTimeUtils.toDateTime(state.event.startTime ?? '');
//                 if (DateUtils.isSameDay(
//                     eventStartDateTime, currentSelectedDate)) {
//                   eventCubit.getAllEvent(
//                       date: eventStartDateTime.toIso8601String());
//                 }

//                 if (args.isFromCalendar) {
//                   // get all event in month to show marker in calendar
//                   final today = DateTime.now();
//                   eventCubit.getAllCalendarEvent(
//                       startDate: DateTime(today.year, today.month, -7)
//                           .toIso8601String(),
//                       endDate: DateTime(today.year, today.month, 37)
//                           .toIso8601String());
//                 }
//               }
//               if (state is EventUpdateEventFailedState) {
//                 ViewUtils.toastSuccess('Cập nhật sự kiện thất bại!');
//                 hideLoading();
//               }
//             },
//             buildWhen: (previous, current) => current is EventShowFullDayState,
//             builder: (context, state) {
//               if (state is EventShowFullDayState && !state.isShow) {
//                 return Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text('Bắt đầu'),
//                         const Spacer(),
//                         SelectDateTimeItem(
//                           key: UniqueKey(),
//                           intialDateTime: event.startTime ?? '',
//                           onTimeChanged: (dateTime) {
//                             cubit.onCheckRangeDateTime(
//                                 dateTime, event.endTime!);
//                           },
//                           onDateChange: (dateTime) {
//                             cubit.onCheckRangeDateTime(
//                                 dateTime, event.endTime!);
//                           },
//                         )
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         const Text('Kết thúc'),
//                         const Spacer(),
//                         SelectDateTimeItem(
//                           key: UniqueKey(),
//                           intialDateTime: event.endTime ?? '',
//                           onTimeChanged: (dateTime) {
//                             cubit.onCheckRangeDateTime(
//                                 event.startTime!, dateTime);
//                           },
//                           onDateChange: (dateTime) {
//                             cubit.onCheckRangeDateTime(
//                                 event.startTime!, dateTime);
//                           },
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 );
//               } else {
//                 return Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text('Bắt đầu'),
//                         const Spacer(),
//                         SelectDateTimeItem(
//                           showTime: false,
//                           intialDateTime: event.startTime ?? '',
//                           onTimeChanged: (dateTime) {
//                             cubit.onCheckRangeDateTime(
//                                 dateTime, event.endTime!);
//                           },
//                           onDateChange: (dateTime) {
//                             cubit.onCheckRangeDateTime(
//                                 dateTime, event.endTime!);
//                           },
//                         )
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         const Text('Kết thúc'),
//                         const Spacer(),
//                         SelectDateTimeItem(
//                           showTime: false,
//                           intialDateTime: event.endTime ?? '',
//                           onTimeChanged: (dateTime) {
//                             cubit.onCheckRangeDateTime(
//                                 event.startTime!, dateTime);
//                           },
//                           onDateChange: (dateTime) {
//                             cubit.onCheckRangeDateTime(
//                                 event.startTime!, dateTime);
//                           },
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 );
//               }
//             },
//           ),
//           BlocConsumer<EventCubit, EventState>(
//             listenWhen: (previous, current) =>
//                 current is EventCheckedRangeDateTimeState,
//             listener: (context, state) {
//               if (state is EventCheckedRangeDateTimeState) {
//                 event.startTime = state.startTime;
//                 event.endTime = state.endTime;
//               }
//             },
//             buildWhen: (previous, current) =>
//                 current is EventCheckedRangeDateTimeState,
//             builder: (context, state) {
//               if (state is EventCheckedRangeDateTimeState &&
//                   !state.isSastified) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Ngày kết thúc phải lớn hơn ngày bắt đầu',
//                       style: AppTextTheme.robotoRegular14
//                           .copyWith(color: AppColor.error400),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 );
//               } else {
//                 return const SizedBox();
//               }
//             },
//           ),
//           const Divider(),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text(
//             'Địa điểm',
//             style: AppTextTheme.robotoBold16,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               SvgPicture.asset(Assets.icLocation),
//               Expanded(
//                 child: PrimaryTextField(
//                   controller: locationController,
//                   border: const UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColor.fourth200),
//                   ),
//                   hintText: 'Thêm địa điểm',
//                   inputTextStyle: AppTextTheme.robotoRegular14,
//                   textInputAction: TextInputAction.newline,
//                   maxLength: 100,
//                   // hintT
//                   //h(color: AppColor.fourth700),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             'Mô tả',
//             style: AppTextTheme.robotoBold16,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               SvgPicture.asset(Assets.icList),
//               Expanded(
//                 child: PrimaryTextField(
//                   controller: descriptionController,
//                   border: const UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColor.fourth200),
//                   ),
//                   hintText: 'Thêm mô tả',
//                   inputTextStyle: AppTextTheme.robotoRegular14,
//                   textInputAction: TextInputAction.newline,
//                   // hintT
//                   //h(color: AppColor.fourth700),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 80,
//           ),
//         ],
//       ),
//     );
//   }

//   void _onSave() {
//     final c1 = titleFormKey.currentState!.validate();
//     if (!c1) {
//       Scrollable.ensureVisible(titleFormKey.currentContext!,
//           duration: const Duration(milliseconds: 200));
//       return;
//     }
//     if (event.startTime!.compareTo(event.endTime!) > 0) return;
//     showLoading();
//     event.title = titleController.text.trim();
//     event.location = locationController.text.trim();
//     event.description = descriptionController.text.trim();
//     if (getImageBloc.imageData.isNotEmpty &&
//         getImageBloc.imageData.first.type != ImageDataType.addNew) {
//       getImageBloc.add(GetImageGetMultiImageUrlEvent());
//     } else {
//       if (args.isAddNew) {
//         cubit.addEvent(event);
//       } else {
//         cubit.updateEvent(event);
//       }
//     }
//   }
// }
