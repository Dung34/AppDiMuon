import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../data/resources/resources.dart';
import '../../etx/app_ext.dart';
import '../container/primary_container.dart';

class PrimaryQrView extends StatelessWidget {
  final String data;
  const PrimaryQrView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final w = context.screenWidth;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imQrBounder),
        ),
      ),
      padding: const EdgeInsets.all(16),
      width: w * 0.53,
      height: w * 0.53,
      child: PrimaryContainer(
        borderColor: AppColor.secondary400,
        borderWidth: 6,
        borderRadius: 8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: QrImageView(
            data: data,
            errorCorrectionLevel: QrErrorCorrectLevel.H,
            backgroundColor: AppColor.white,
          ),
        ),
      ),
    );
  }
}
