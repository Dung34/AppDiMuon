import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes.dart';
import '../../../data/resources/colors.dart';
import '../../../shared/utils/validation_utils.dart';
import '../../../shared/widgets/button/primary_button.dart';
import '../../../shared/widgets/something/primary_app_bar.dart';
import '../../../shared/widgets/text_field/primary_text_field.dart';
import '../../base/bloc/auth/auth_bloc.dart';

class SendOtp extends StatefulWidget {
  const SendOtp({super.key});

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = AuthBloc();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final usernameFormKey = GlobalKey<FormState>();
    final emailFormKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: PrimaryAppBar(
        canPop: true,
        elevation: 0,
      ),
      backgroundColor: AppColor.primaryBackgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          Text("Lấy lại mật khẩu",
              style: Theme.of(context).textTheme.bodyLarge),
          PrimaryTextField(
            controller: usernameController,
            label: "Tên đăng nhập",
            hintText: "Nhập tên đăng nhập",
            formKey: usernameFormKey,
            validator: ValidationUtils.textEmptyValidator,
            textInputAction: TextInputAction.next,
            maxLength: 50,
          ),
          PrimaryTextField(
            controller: emailController,
            label: "Email",
            hintText: "Nhập email",
            formKey: emailFormKey,
            validator: ValidationUtils.emailValidator,
            maxLength: 100,
          ),
          BlocProvider(
            create: (context) => authBloc,
            child: PrimaryButton(
                context: context,
                onPressed: () {
                  // authBloc.userRepository.sendOTP(
                  //     username: usernameController.text.trim(),
                  //     type: "email",
                  //     value: emailController.text.trim());
                  Navigator.pushNamed(context, AppRoute.inputOtp,
                      arguments:
                          LoginArgs(authBloc: authBloc, isSignIn: false));
                },
                label: "Xác nhận"),
          )
        ],
      )),
    );
  }
}
