import 'package:animated_widgets/animated_widgets.dart';
import '../../../config/routes.dart';
import '../../../data/resources/resources.dart';
import '../../../di/di.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/utils/dialog_helper.dart';
import '../../../shared/utils/validation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/utils/view_utils.dart';
import '../../../shared/widgets/button/primary_button.dart';
import '../../../shared/widgets/container/primary_container.dart';
import '../../../shared/widgets/text_field/primary_text_field.dart';
import '../../base/bloc/auth/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final AuthBloc authBloc = getIt.get<AuthBloc>()..add(AuthInitEvent());
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    onLoginPressed() {
      final c1 = usernameFormKey.currentState?.validate() ?? false;
      final c2 = passwordFormKey.currentState?.validate() ?? false;
      context.showAppDialog(getLoadingDialog());
      if (!c1 || !c2) {
        context.pop();
        return;
      }
      authBloc.add(AuthLoginRequestEvent(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      ));
      // Navigator.of(context).pushNamed(AppRoute.main);
    }

    return BlocProvider.value(
      value: authBloc,
      child: Scaffold(
        backgroundColor: AppColor.green10,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TranslationAnimatedWidget(
                      enabled: true,
                      duration: const Duration(milliseconds: 1000),
                      values: const [
                        Offset(0, -100), // disabled value value
                        Offset(0, 0), //intermediate value
                        Offset(0, 0) //enabled value
                      ],
                      curve: Curves.slowMiddle,
                      child: OpacityAnimatedWidget.tween(
                        opacityEnabled: 1,
                        opacityDisabled: 0,
                        duration: const Duration(milliseconds: 1200),
                        child: Center(
                          child: Image.asset(
                            height: context.screenWidth * 121 / 428,
                            Assets.imAppLogoHorizontal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 11),
                    MultiBlocListener(
                      listeners: [
                        BlocListener<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is AuthFieldRequiredState) {
                              ViewUtils.toastWarning(
                                  'Tên đăng nhập và mật khẩu không được bỏ trống');
                            }
                            if (state is AuthLoadingState) {}
                            if (state is AuthLoginSuccessState) {
                              WidgetsBinding.instance
                                  .addPostFrameCallback(((timeStamp) {
                                context.pop();
                                Navigator.pushNamedAndRemoveUntil(context,
                                    AppRoute.selectTenant, (route) => false);
                              }));
                            }
                            if (state is AuthLoginFailedState) {
                              context.pop();
                              // context.pop();
                              // ViewUtils.toastWarning(state.message!);
                            }
                            if (state is AuthLoginBySSOSuccessState) {
                              WidgetsBinding.instance
                                  .addPostFrameCallback(((timeStamp) {
                                context.pop();
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRoute.main,
                                  (route) => false,
                                );
                              }));
                            }
                            if (state is AuthGetLocalInfoState) {
                              usernameController.text = state.username;
                              passwordController.text = state.password;
                            }
                          },
                        ),
                      ],
                      child: const SizedBox(height: 0),
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Welcome to ',
                            style: AppTextTheme.lexendBold30,
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Active+',
                              style: AppTextTheme.lexendBold30
                                  .copyWith(color: AppColor.green200))
                        ])),
                    const SizedBox(height: 26),
                    PrimaryContainer(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            color: AppColor.black.withOpacity(0.15),
                            offset: const Offset(1, 1))
                      ],
                      child: PrimaryTextField(
                        hintText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        fillColor: AppColor.white,
                        hintTextStyle: AppTextTheme.robotoRegular16,
                        labelStyle: AppTextTheme.robotoRegular16,
                        controller: usernameController,
                        textInputAction: TextInputAction.next,
                        maxLength: context.screenWidth.floor() - 60,
                        formKey: usernameFormKey,
                        validator: ValidationUtils.textEmptyValidator,
                      ),
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (pre, current) =>
                          current is AuthShowPasswordState,
                      builder: (context, state) {
                        if (state is AuthShowPasswordState) {
                          return PrimaryContainer(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: AppColor.black.withOpacity(0.15),
                                  offset: const Offset(1, 1))
                            ],
                            child: PrimaryTextField(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              hintTextStyle: AppTextTheme.robotoRegular16,
                              labelStyle: AppTextTheme.robotoRegular16,
                              controller: passwordController,
                              fillColor: AppColor.white,
                              textInputAction: TextInputAction.done,
                              maxLength: 100,
                              maxLines: 1,
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
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoute.sendOtp,
                                  arguments: LoginArgs(
                                      authBloc: authBloc, isSignIn: false));
                            },
                            child: const Text("Forgot password?"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: BlocBuilder<AuthBloc, AuthState>(
                            buildWhen: (pre, current) =>
                                current is AuthRememberState,
                            builder: (context, state) {
                              if (state is AuthRememberState) {
                                return CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    dense: false,
                                    value: state.remember,
                                    onChanged: (value) {
                                      authBloc.add(
                                          AuthRememberEvent(!state.remember));
                                    },
                                    contentPadding: EdgeInsets.zero,
                                    selectedTileColor: Colors.red,
                                    title: const Text(
                                      'Keep me sign in',
                                      style: AppTextTheme.robotoMedium16,
                                    ));
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryButton(
                        context: context,
                        onPressed: onLoginPressed,
                        label: 'Sign in'),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // BlocBuilder<AuthBloc, AuthState>(
                    //   buildWhen: (pre, current) =>
                    //       current is AuthLoginBySSOLoadingState ||
                    //       current is AuthLoginBySSOSuccessState ||
                    //       current is AuthLoginBySSOErrorState,
                    //   builder: (context, state) {
                    //     if (state is AuthLoginBySSOLoadingState) {
                    //       return PrimaryButton(
                    //           context: context,
                    //           isLoading: true,
                    //           backgroundColor: AppColor.secondaryColor,
                    //           onPressed: () => null,
                    //           label: '');
                    //     } else {
                    //       return PrimaryButton(
                    //         context: context,
                    //         backgroundColor: AppColor.secondaryColor,
                    //         onPressed: () {
                    //           authBloc.add(AuthLoginBySSORequestEvent());
                    //         },
                    //         label: "Đăng Nhập Với True Connect",
                    //       );
                    //     }
                    //   },
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Chưa có tài khoản ?"),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: (() {
                            Navigator.pushNamed(context, AppRoute.register);
                          }),
                          child: const Text("Đăng kí ngay",
                              style: TextStyle(color: Colors.blue)),
                        )
                      ],
                    )
                    // Center(
                    //   child: RichText(
                    //       text: TextSpan(children: [
                    //     const TextSpan(
                    //       text: 'Chưa có tài khoản? ',
                    //       style: AppTextTheme.textPrimaryBold,
                    //     ),
                    //     TextSpan(
                    //         text: 'Đăng ký ngay',
                    //         style: AppTextTheme.textPrimaryBold
                    //             .copyWith(color: AppColor.primaryColor),
                    //         recognizer: TapGestureRecognizer()
                    //           ..onTap = () {
                    //             Navigator.of(context)
                    //                 .pushNamed(AppRoute.register);
                    //           }),
                    //   ])),
                    // ),
                    // const SizedBox(
                    //   height: 45,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
