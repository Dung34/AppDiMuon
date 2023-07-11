import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../shared/etx/view_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/something/primary_qr_view.dart';

class EventQrPage extends StatelessWidget {
  const EventQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = context.screenWidth;
    final args = context.arguments as EventQrPageArgs;
    return Scaffold(
      backgroundColor: AppColor.primaryBackgroundColor,
      appBar: PrimaryAppBar(
        canPop: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Center(
              child: Image.asset(
                Assets.imAppLogoHorizontal,
                width: w * 166 / 428,
              ),
            ),
            const SizedBox(height: 40),
            PrimaryQrView(data: 'event:${args.event.id}'),
            const SizedBox(height: 40),
            Text(
              args.event.title ?? '',
              textAlign: TextAlign.center,
              style: AppTextTheme.lexendBold30,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icClock),
                const SizedBox(width: 10),
                Text(
                  DateTimeUtils.formatDate(
                    args.event.startTime ?? '',
                    showTime: true,
                  ),
                  textAlign: TextAlign.center,
                  style: AppTextTheme.robotoMedium18.copyWith(
                    color: AppColor.primary400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              args.event.location ?? '',
              textAlign: TextAlign.center,
              style: AppTextTheme.robotoLight16,
            ),
          ]),
        ),
      ),
    );
  }
}
