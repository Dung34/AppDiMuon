// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../data/constant/enum.dart';
// import '../../../data/resources/resources.dart';
// import '../../../domain/entity/user/user.dart';
// import '../../../shared/etx/app_ext.dart';
// import '../../../shared/widgets/button/primary_icon_button.dart';
// import '../../../shared/widgets/image/primary_circle_image.dart';
// import '../../../shared/widgets/image/primary_image.dart';
// import '../../base/bloc/get_image/get_image_bloc.dart';

// class ProfileUpdateImage extends StatelessWidget {
//   final UserEntity user;
//   const ProfileUpdateImage({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     final GetImageBloc getImageBloc = context.read<GetImageBloc>();
//     final width = context.screenWidth;
//     return SizedBox(
//       height: width * 9 / 16 + 80,
//       child: Stack(
//         children: [
//           BlocBuilder<GetImageBloc, GetImageState>(
//             buildWhen: (pre, current) {
//               return (current is GetImagePickImageSuccessState &&
//                   current.type == ImageType.cover);
//             },
//             builder: (context, state) {
//               return (state is GetImagePickImageSuccessState)
//                   ? Image(
//                       image: FileImage(File(state.imagePath)),
//                       width: width,
//                       height: width * 9 / 16,
//                     )
//                   : PrimaryNetworkImage(
//                       imageUrl: user.coverImage,
//                       width: width,
//                       height: width * 9 / 16,
//                     );
//             },
//           ),
//           Container(
//             width: width,
//             height: width * 9 / 16,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//                 colors: AppColor.coverImageGradient,
//               ),
//             ),
//           ),
//           Positioned(
//             right: 16,
//             bottom: 96,
//             child: PrimaryIconButton(
//               context: context,
//               backgroundColor: AppColor.transparent,
//               onPressed: () {
//                 getImageBloc.add(GetImagePickerEvent(
//                     shouldCrop: true, type: ImageType.cover));
//               },
//               icon: Assets.icCamera,
//               iconColor: Colors.white,
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             child: SizedBox(
//               height: 170,
//               width: width,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 80,
//                     child: Container(
//                       height: 80,
//                       width: width,
//                       decoration: const ShapeDecoration(
//                         color: AppColor.primaryBackgroundColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     child: SizedBox(
//                       width: width,
//                       child: Stack(
//                         children: [
//                           Center(
//                             child: BlocBuilder<GetImageBloc, GetImageState>(
//                               buildWhen: (pre, current) {
//                                 return (current
//                                         is GetImagePickImageSuccessState &&
//                                     current.type == ImageType.avatar);
//                               },
//                               builder: (context, state) {
//                                 return (state is GetImagePickImageSuccessState)
//                                     ? CircleAvatar(
//                                         radius: 80,
//                                         backgroundColor:
//                                             AppColor.primaryBackgroundColor,
//                                         child: PrimaryCircleImage(
//                                           imageFilePath: state.imagePath,
//                                           radius: 76,
//                                         ),
//                                       )
//                                     : CircleAvatar(
//                                         radius: 80,
//                                         backgroundColor:
//                                             AppColor.primaryBackgroundColor,
//                                         child: PrimaryCircleImage(
//                                           imageUrl: user.avatar,
//                                           radius: 76,
//                                         ),
//                                       );
//                               },
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 4,
//                             right: 0,
//                             left: 0,
//                             child: Center(
//                               child: Material(
//                                 color: AppColor.transparent,
//                                 child: InkWell(
//                                   onTap: () {
//                                     getImageBloc.add(
//                                       GetImagePickerEvent(
//                                           shouldCrop: true,
//                                           type: ImageType.avatar),
//                                     );
//                                   },
//                                   radius: 30,
//                                   borderRadius: const BorderRadius.only(
//                                     bottomLeft: Radius.circular(10),
//                                     bottomRight: Radius.circular(10),
//                                   ),
//                                   highlightColor: AppColor.transparent,
//                                   child: Ink(
//                                     height: 76,
//                                     width: 152,
//                                     decoration: BoxDecoration(
//                                       color: AppColor.black.withOpacity(0.5),
//                                       borderRadius: const BorderRadius.only(
//                                         bottomLeft: Radius.circular(76),
//                                         bottomRight: Radius.circular(76),
//                                       ),
//                                     ),
//                                     child: Container(
//                                       height: 38,
//                                       width: 38,
//                                       alignment: Alignment.center,
//                                       child: SvgPicture.asset(
//                                         Assets.icCamera,
//                                         height: 38,
//                                         width: 38,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
