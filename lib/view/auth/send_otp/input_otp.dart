import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

import '../../../config/routes.dart';
import '../../../data/resources/colors.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/widgets/button/primary_button.dart';
import '../../../shared/widgets/something/primary_app_bar.dart';

class InputOTP extends StatefulWidget {
  const InputOTP({super.key});

  @override
  State<InputOTP> createState() => _InputOTPState();
}

class _InputOTPState extends State<InputOTP> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  late LoginArgs args;
  @override
  void didChangeDependencies() {
    args = context.arguments as LoginArgs;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      backgroundColor: AppColor.primaryBackgroundColor,
      appBar: PrimaryAppBar(
        canPop: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Pinput(
            closeKeyboardWhenCompleted: true,
            controller: pinController,
            length: 6,
            focusNode: focusNode,
            defaultPinTheme: defaultPinTheme,
            onCompleted: (pin) {
              log('onCompleted: $pin');
              pinController.text = pin;
            },
          ),
          PrimaryButton(
              context: context,
              onPressed: () {
                args.authBloc.userRepository
                    .checkOTP(username: "abcxyz", key: pinController.text);
              },
              label: "Xác nhận")
        ],
      )),
    );
  }
}
