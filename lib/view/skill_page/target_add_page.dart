// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../../data/constant/enum.dart';
// import '../../domain/entity/target/target.dart';
// import '../../shared/widgets/something/primary_app_bar.dart';
// import '../../shared/widgets/text_field/primary_text_field.dart';
// import '../base/base_page_sate.dart';


// class AddTargetPage extends StatefulWidget {
//   const AddTargetPage({super.key});

//   @override
//   State<AddTargetPage> createState() => _AddTargetPageState();
// }

// class _AddTargetPageState extends BasePageState<AddTargetPage, TargetCubit> {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController startDate = TextEditingController();
//   final TextEditingController endDate = TextEditingController();
//   late final Target target;
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//     setAppBar = PrimaryAppBar(
//       title: "Thêm mục tiêu",
//       canPop: true,
//       actions: [
//         IconButton(
//             onPressed: () {
//               String startDateString = startDate.text;
//               String endDateString = endDate.text;
//               DateFormat dateFormat = DateFormat("dd/MM/yyyy");
//               DateTime startDateTime = dateFormat.parse(startDateString);
//               DateTime endDateTiem = dateFormat.parse(endDateString);
//               cubit.addTarget(Target(
//                 startDate: startDateTime.toIso8601String(),
//                 endDate: endDateTiem.toIso8601String(),
//                 title: titleController.text.trim(),
//                 description: descriptionController.text.trim(),
//               ));
//             },
//             icon: Icon(Icons.edit))
//       ],
//     );
//   }

//   @override
//   Widget buildPage(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         PrimaryTextField(
//           controller: titleController,
//           label: "Tiêu đề",
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         PrimaryTextField(
//           controller: descriptionController,
//           label: "Mô tả",
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         PrimaryTextField(
//           controller: startDate,
//           label: "Ngày bắt đầu",
//           inputType: AppInputType.datePicker,
//           context: context,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         PrimaryTextField(
//           controller: endDate,
//           label: "Kết thúc",
//           inputType: AppInputType.datePicker,
//           context: context,
//         )
//       ],
//     );
//   }
// }
