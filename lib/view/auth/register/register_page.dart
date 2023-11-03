import '../../../data/resources/resources.dart';
import '../../../shared/widgets/something/primary_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/validation_utils.dart';
import '../../../shared/widgets/text_field/primary_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final accountController = TextEditingController();
  final accountFormKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final phoneNumberFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackgroundColor,
      appBar: PrimaryAppBar(
        canPop: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(Assets.imAppLogoVertical, scale: 1.2),
              const Text(
                'Đăng ký tài khoản',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              PrimaryTextField(
                label: 'Tên đăng nhập',
                labelStyle: AppTextTheme.textPrimaryBoldMedium,
                controller: accountController,
                textInputAction: TextInputAction.next,
                maxLength: 100,
                formKey: accountFormKey,
                validator: ValidationUtils.textEmptyValidator,
              ),
              const SizedBox(height: 20),
              PrimaryTextField(
                label: 'Mật khẩu',
                labelStyle: AppTextTheme.textPrimaryBoldMedium,
                controller: passwordController,
                textInputAction: TextInputAction.next,
                maxLength: 100,
                formKey: passwordFormKey,
                validator: ValidationUtils.textEmptyValidator,
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryTextField(
                label: 'Email',
                labelStyle: AppTextTheme.textPrimaryBoldMedium,
                controller: emailController,
                textInputAction: TextInputAction.next,
                maxLength: 100,
                formKey: emailFormKey,
                validator: ValidationUtils.emailValidator,
              ),
              const SizedBox(height: 20),
              PrimaryTextField(
                controller: phoneNumberController,
                label: "Số điện thoại",
                labelStyle: AppTextTheme.textPrimaryBoldMedium,
                textInputAction: TextInputAction.next,
                maxLength: 12,
                keyboardType: TextInputType.phone,
                formKey: phoneNumberFormKey,
                validator: ValidationUtils.textEmptyValidator,
              )
            ],
          ),
        ),
      ),
    );
  }
}
