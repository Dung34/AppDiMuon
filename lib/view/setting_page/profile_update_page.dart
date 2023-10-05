import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constant/enum.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/user/user.dart';
import '../../shared/etx/view_ext.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/get_image/get_image_bloc.dart';
import '../base/bloc/user/user_cubit.dart';

class ProfileUpdatePage extends StatefulWidget {
  // final UserCubit userCubit;
  const ProfileUpdatePage({
    super.key,

    // required this.userCubit,
  });

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState
    extends BasePageState<ProfileUpdatePage, UserCubit> {
  @override
  bool get useBlocProviderValue => true;
  @override
  UserCubit get cubit => context.read<UserCubit>();
  @override
  EdgeInsets get padding => EdgeInsets.zero;
  @override
  bool get useSafeArea => false;
  @override
  bool get isUseLoading => true;

  late final UserEntity userUpdate;

  late UserEntity user;

  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final nameFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cubit.getUser();
    user = cubit.currentUser!;
    userUpdate = user.copyWith();
    emailController.text = user.email ?? '';
    nameController.text = user.fullName ?? '';
    phoneController.text = user.phoneNumber ?? '';
  }

  final getImageBloc = GetImageBloc();

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        leading: PrimaryIconButton(
            context: context,
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: 'Thông tin cá nhân',
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BlocProvider(
            //   create: (context) => getImageBloc,
            //   child: BlocListener<GetImageBloc, GetImageState>(
            //     listener: (context, state) {
            //       if (state is GetImagePickImageSuccessState) {
            //         getImageBloc.add(GetImageGetSingleImageUrlEvent(
            //             imagePath: state.imagePath, imageType: state.type));
            //         showLoading();
            //       }
            //       if (state is GetImageGetSingleImageUrlSuccessState &&
            //           state.type == ImageType.avatar) {
            //         // userUpdate.avatar = state.imageUrl;
            //         hideLoading();
            //       }
            //       if (state is GetImageGetSingleImageUrlSuccessState &&
            //           state.type == ImageType.cover) {
            //         // userUpdate.coverImage = state.imageUrl;
            //         hideLoading();
            //       }
            //       if (state is GetImageGetSingleImageUrlErrorState) {
            //         hideLoading();
            //       }
            //     },
            //     // child: ProfileUpdateImage(user: user),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  PrimaryTextField(
                    controller: nameController,
                    label: 'Họ và tên',
                    hintText: 'Nhập họ và tên',
                    isRequired: true,
                    formKey: nameFormKey,
                    maxLength: 50,
                    validator: ValidationUtils.textEmptyValidator,
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(height: 20),
                  PrimaryTextField(
                    controller: dobController,
                    inputType: AppInputType.datePicker,
                    label: 'Ngày sinh',
                    hintText: 'Nhập ngày sinh',
                    onDateSelected: (value) {
                      // userUpdate.dob = value.toIso8601String();
                    },
                    context: context,
                  ),
                  const SizedBox(height: 20),
                  PrimaryTextField(
                    controller: phoneController,
                    label: 'Số điện thoại',
                    maxLength: 11,
                    hintText: 'Nhập số điện thoại',
                  ),
                  const SizedBox(height: 20),
                  PrimaryTextField(
                    controller: emailController,
                    label: 'Email',
                    maxLength: 100,
                    hintText: 'Nhập email',
                  ),
                  const SizedBox(height: 20),
                  BlocListener<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state is UserUpdateSuccessState) {
                        hideLoading();
                        context.pop();
                      }
                      if (state is UserUpdateFailedState) {
                        hideLoading();
                      }
                    },
                    child: PrimaryButton(
                      context: context,
                      onPressed: () {
                        if (!nameFormKey.currentState!.validate()) {
                          return;
                        }
                        showLoading(dismissible: false);
                        // userUpdate.fullname = nameController.text.trim();
                        // userUpdate.company = companyController.text.trim();
                        // userUpdate.dob = dobController.text.trim();
                        cubit.updateUser(userUpdate);
                      },
                      label: 'Lưu thông tin',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
