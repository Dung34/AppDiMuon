import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/resources/resources.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/utils/view_utils.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/auth/auth_bloc.dart';
import '../base/bloc/user/user_cubit.dart';

class ProfileChangePasswordPage extends StatefulWidget {
  const ProfileChangePasswordPage({super.key});

  @override
  State<ProfileChangePasswordPage> createState() =>
      _ProfileChangePasswordPageState();
}

class _ProfileChangePasswordPageState
    extends BasePageState<ProfileChangePasswordPage, UserCubit> {
  final repasswordController = TextEditingController();

  final passwordController = TextEditingController();

  final repasswordFormKey = GlobalKey<FormState>();

  final passwordFormKey = GlobalKey<FormState>();

  final AuthBloc authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => authBloc..add(AuthInitEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColor.primaryBackgroundColor,
        appBar: PrimaryAppBar(
          backgroundColor: AppColor.primaryBackgroundColor,
          elevation: 0,
          canPop: true,
          // title: 'Đổi mật khẩu',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  height: context.screenWidth * 9 / 16,
                  Assets.imAppLogoHorizontal,
                ),
                const Text(
                  'Đổi mật khẩu',
                  style: AppTextTheme.textGreeting,
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocListener<UserCubit, UserState>(
                  listener: (context, state) {
                    if (state is UserChangePasswordSuccessState) {
                      context.pop();
                      hideLoading();
                    }
                    if (state is UserChangePasswordFailedState) {
                      hideLoading();
                    }
                  },
                  child: const SizedBox(),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (pre, current) => current is AuthShowPasswordState,
                  builder: (context, state) {
                    if (state is AuthShowPasswordState) {
                      return PrimaryTextField(
                        hintText: 'Mật khẩu mới',
                        label: 'Mật khẩu mới',
                        labelStyle: AppTextTheme.textPrimaryBoldMedium,
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        maxLength: 100,
                        maxLines: 1,
                        prefixIcon: Assets.icLock,
                        obscureText: !state.showPassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            authBloc.add(
                              AuthShowPasswordEvent(
                                  showPassword: !state.showPassword),
                            );
                          },
                          icon: SvgPicture.asset(
                            state.showPassword
                                ? Assets.icEyeOff
                                : Assets.icEyeOn,
                            color: AppColor.black,
                          ),
                        ),
                        formKey: passwordFormKey,
                        validator: ValidationUtils.textEmptyValidator,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (pre, current) => current is AuthShowPasswordState,
                  builder: (context, state) {
                    if (state is AuthShowPasswordState) {
                      return PrimaryTextField(
                        hintText: 'Nhập lại Mật khẩu',
                        label: 'Nhập lại Mật khẩu',
                        labelStyle: AppTextTheme.textPrimaryBoldMedium,
                        controller: repasswordController,
                        textInputAction: TextInputAction.done,
                        maxLength: 100,
                        maxLines: 1,
                        prefixIcon: Assets.icLock,
                        obscureText: !state.showPassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            authBloc.add(
                              AuthShowPasswordEvent(
                                  showPassword: !state.showPassword),
                            );
                          },
                          icon: SvgPicture.asset(
                            state.showPassword
                                ? Assets.icEyeOff
                                : Assets.icEyeOn,
                            color: AppColor.black,
                          ),
                        ),
                        formKey: repasswordFormKey,
                        validator: ValidationUtils.textEmptyValidator,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  context: context,
                  onPressed: onChangePasswordPressed,
                  label: "Thay đổi",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onChangePasswordPressed() {
    final c1 = passwordFormKey.currentState?.validate() ?? false;
    final c2 = repasswordFormKey.currentState?.validate() ?? false;
    if (!c1 || !c2) return;
    if (passwordController.text != repasswordController.text) {
      ViewUtils.toastWarning('Mật khẩu nhập vào không trùng nhau');
      return;
    }
    showLoading();
    userCubit.changePassword(
      newPassword: passwordController.text,
      rePassword: repasswordController.text,
    );
  }
}
