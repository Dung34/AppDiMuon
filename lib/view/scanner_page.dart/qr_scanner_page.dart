import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../data/resources/colors.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/dialog_helper.dart';
import '../base/base_page_sate.dart';
import '../event_page/cubit/event_cubit.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends BasePageState<QrScannerPage, EventCubit> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;

  @override
  void initState() {
    super.initState();
    cubit.getCurrentLocation();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    final w = context.screenWidth;
    return Scaffold(
      body: SafeArea(
        child: BlocListener<EventCubit, EventState>(
          listener: (context, state) {
            if (state is EventCurrentLocationDeniedForeverState) {
              context.showAppDialog(
                getAlertDialog(
                  context: context,
                  title: 'Yêu cầu quyền truy cập',
                  message:
                      'Bạn cần cấp quyền truy cập vị trí để thực hiện Check In',
                  positiveText: 'Mở Cài đặt',
                  onNegativePressed: () {
                    context.pop();
                  },
                  onPositivePressed: () {
                    cubit.openAppSetting();
                  },
                ),
              );
            }
            if (state is EventHasPermissionState) {
              if (state.hasPermission) {
                controller!.resumeCamera();
                context.showAppDialog(getAlertDialog(
                    context: context,
                    title: 'title',
                    message: 'address: ${state.currentLocation?.address}'));
              } else {
                controller!.pauseCamera();
                context.showAppDialog(
                  getAlertDialog(
                    context: context,
                    title: 'Yêu cầu quyền truy cập',
                    message:
                        'Bạn cần cấp quyền truy cập vị trí để thực hiện Check In',
                    positiveText: 'Mở Cài đặt',
                    onNegativePressed: () {
                      context.pop();
                    },
                    onPositivePressed: () {
                      cubit.openAppSetting();
                    },
                  ),
                );
              }
            }
          },
          child: QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: AppColor.primary500,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: w * 0.7,
            ),
          ),
        ),
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      controller.resumeCamera();
      controller.scannedDataStream.listen((scanData) async {
        barcode = scanData;
        if (barcode!.code!.contains("scancard/")) {
          controller.pauseCamera();
          // controller.resumeCamera();
        } else {
          controller.pauseCamera();
          context.showAppDialog(
            getAlertDialog(
              context: context,
              title: 'Thông báo',
              message: 'Mã QR không hợp lệ.',
              onNegativePressed: () {
                Navigator.pop(context);
                controller.resumeCamera();
              },
            ),
          );
        }
      });
    });
  }
}
