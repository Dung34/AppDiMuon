import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../config/config.dart';
import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../di/di.dart';
import '../../domain/mapper/event_data_mapper.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/dialog_helper.dart';
import '../../shared/utils/view_utils.dart';
import '../../shared/widgets/container/primary_container.dart';
import '../../shared/widgets/image/primary_circle_image.dart';
import '../base/base_page_sate.dart';
import '../event_page/cubit/event_cubit.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends BasePageState<QrScannerPage, EventCubit> {
  @override
  void initState() {
    super.initState();
    cubit.getCurrentLocation();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      log('pauseCamera1');

      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  bool get isUseLoading => true;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  bool get useSafeArea => false;

  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;
  late final args = context.arguments as QrScannerPageArgs;
  late String currentLocationStr = '';
  String lastestUsername = '';
  String lastestEventId = '';

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
                currentLocationStr = state.currentLocation?.address ?? '';
                // context.showAppDialog(getAlertDialog(
                //     context: context,
                //     title: 'title',
                //     message: 'address: ${state.currentLocation?.address}'));
              } else {
                log('pauseCamera2');
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
            if (state is EventJoinEventSuccessState) {
              lastestUsername = state.userEventJoined.username ?? '';
              lastestEventId = state.userEventJoined.eventId ?? '';
              controller?.resumeCamera();
              if (state.isUserScan) {
                ViewUtils.toastSuccess('Check In thành công!');
                Navigator.pushReplacementNamed(
                  context,
                  AppRoute.eventDetail,
                  arguments: EventDetailPageArgs(
                    eventId: getIt
                            .get<EventDataMapper>()
                            .mapToEntity(state.userEventJoined.events)
                            .id ??
                        '',
                    eventCubit: cubit,
                  ),
                );
              } else {
                controller?.resumeCamera();
                showToast('',
                    child: SizedBox(
                      height: context.screenHeight * 0.15,
                      width: context.screenWidth,
                      child: Scaffold(
                        backgroundColor: AppColor.primaryBackgroundColor,
                        body: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              PrimaryCircleImage(
                                radius: 24,
                                imageUrl: state.userEventJoined.avatar ?? '',
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Checkin thành công!',
                                      style: AppTextTheme.lexendBold24,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      state.userEventJoined.fullname ?? '',
                                      style: AppTextTheme.robotoMedium18,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      state.userEventJoined.checkedInLocation ??
                                          '',
                                      style: AppTextTheme.robotoMedium14,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              }
            }
            if (state is EventJoinEventFailedState) {
              controller?.resumeCamera();
              context.showAppDialog(
                getErrorDialog(
                  context: context,
                  message: 'Không tìm thấy người dùng hoặc sự kiện này.',
                ),
              );
            }
          },
          child: Stack(
            children: [
              QRView(
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
              BlocBuilder<EventCubit, EventState>(
                buildWhen: (previous, current) =>
                    current is EventHasPermissionState,
                builder: (context, state) {
                  return state is EventHasPermissionState &&
                          state.currentLocation != null
                      ? Positioned(
                          bottom: 30,
                          left: 16,
                          right: 16,
                          child: PrimaryContainer(
                            padding: const EdgeInsets.all(16),
                            borderColor: AppColor.primary500,
                            backgroundColor: AppColor.primary50,
                            width: w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Vị trí hiện tại',
                                  style: AppTextTheme.lexendRegular14
                                      .copyWith(color: AppColor.fourth900),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.icLocation),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Text(
                                        state.currentLocation!.address,
                                        style: AppTextTheme.robotoBold14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox();
                },
              )
            ],
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
        handleScannerCode(barcode?.code);
        // if () {
        //   log('pauseCamera0');
        //   // controller.pauseCamera();
        // }
      });
    });
  }

  bool handleScannerCode(String? data) {
    if (data == null) return false;
    if (data.startsWith('event:')) {
      final eventId = data.substring(6);
      if (lastestEventId == eventId) {
        return false;
      }
      // cubit.joinEvent(eventId, null, currentLocationStr, isUserScan: true);
      controller?.pauseCamera();
      return true;
    }
    if (data.startsWith('${Environment.domain}/profile/')) {
      final params = data.split('profile/');
      final username = params.length > 1 ? params[1] : '';
      if (lastestEventId == args.eventId && lastestUsername == username) {
        return false;
      }
      if (args.eventId != null) {
        // cubit.joinEvent(args.eventId!, username, currentLocationStr);
      } else {}
      return true;
    }
    return false;
  }
}
