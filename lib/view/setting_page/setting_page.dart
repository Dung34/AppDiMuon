import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/config.dart';
import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../di/di.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/dialog_helper.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../base/bloc/auth/auth_bloc.dart';
import '../base/bloc/user/user_cubit.dart';
import 'component/profile_view_header.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final AuthBloc authBloc = getIt.get<AuthBloc>();
  late final UserCubit userCubit = getIt.get<UserCubit>();

  @override
  Widget build(BuildContext context) {
    return ProfileViewHeader(
      child: BlocProvider.value(
        value: authBloc,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icInfo,
                          color: AppColor.primary500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Cá nhân',
                          style: AppTextTheme.robotoBold18
                              .copyWith(color: AppColor.primary500),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    SettingItem(
                      title: 'Thông tin cá nhân',
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoute.profileUpdate);
                      },
                    ),
                    const Divider(),
                    SettingItem(
                      title: 'Lịch sử tham dự',
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoute.eventHistory);
                      },
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 5,
                color: AppColor.fourth200,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icInfo,
                          color: AppColor.primary500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Cài đặt nâng cao',
                          style: AppTextTheme.robotoBold18
                              .copyWith(color: AppColor.primary500),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    SettingItem(
                      title: 'Đổi mật khẩu',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.changePassword);
                      },
                    ),
                    const Divider(),
                    SettingItem(
                      title: 'Đóng tài khoản',
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (context) => getAlertDialog(
                            context: context,
                            title: 'Xác nhận Xoá tài khoản',
                            message:
                                'Bạn có chắc chắ muốn xóa tài khoản này?\nHành động có thể được hoàn tác nếu bạn liên hệ với đội ngũ CSKH trong vòng 30 ngày. Sau 30 ngày, tất cả dữ liệu của bạn sẽ bị xóa vĩnh viễn và không thể phục hồi.',
                            onPositivePressed: () {
                              authBloc.add(AuthRequestAccoutDeletionEvent());

                              context.showAppDialog(getLoadingDialog());
                            },
                          ),
                        );
                      },
                    ),
                    const Divider(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLogoutSuccessState) {
                    userCubit.currentUser = null;
                    Navigator.popAndPushNamed(context, AppRoute.login);
                  }
                  if (state is AuthRequestDeletionSuccessState) {
                    context.pop();

                    Navigator.popAndPushNamed(context, AppRoute.login);
                  }
                  if (state is AuthRequestDeletionFailedState) {
                    context.pop();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: PrimaryButton(
                    context: context,
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => getAlertDialog(
                          context: context,
                          title: 'Đăng xuất',
                          message:
                              'Bạn có chắc chắn muốn đăng xuất khỏi tài khoản này?',
                          onPositivePressed: () {
                            authBloc.add(AuthLogoutRequestEvent());
                          },
                        ),
                      );
                    },
                    label: 'Đăng xuất',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Version: ${AppConfig.appVersionName}',
                    textAlign: TextAlign.end,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final Function onTap;
  const SettingItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextTheme.lexendRegular16,
              ),
            ),
            SvgPicture.asset(Assets.icArrowRight)
          ],
        ),
      ),
    );
  }
}
