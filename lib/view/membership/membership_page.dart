import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/resources/resources.dart';
import '../../shared/etx/view_ext.dart';
import '../../shared/utils/view_utils.dart';
import '../../shared/widgets/image/primary_circle_image.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/user/user_cubit.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({super.key});

  @override
  State<StatefulWidget> createState() => _MembershipPageState();
}

class _MembershipPageState extends BasePageState<MembershipPage, UserCubit> {
  @override
  bool get useSafeArea => false;

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  Widget buildPage(BuildContext context) {
    final user = userCubit.currentUser;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                ClipPath(
                  clipper: MembershipVIPClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.primaryBackgroundColor,
                      gradient: LinearGradient(
                        colors: AppColor.primaryGradient,
                      ),
                    ),
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  left: context.screenWidth / 2 - 86,
                  top: 250 * 3 / 4 - 86,
                  child: SizedBox(
                    height: 192,
                    child: Stack(
                      children: [
                        Material(
                          elevation: 8,
                          shape: const OvalBorder(),
                          color: AppColor.transparent,
                          child: CircleAvatar(
                            radius: 86,
                            backgroundColor: AppColor.white,
                            child: PrimaryCircleImage(
                              radius: 80,
                              imageUrl: userCubit.currentUser?.avatar ?? '',
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColor.primaryColor,
                            child: SvgPicture.asset(Assets.icSetting),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            user?.roleStr ?? '',
            style: AppTextTheme.robotoMedium18.copyWith(
              color: AppColor.primary500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            user?.fullname ?? '',
            style: AppTextTheme.lexendBold30.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: AppColor.secondary500),
          ),
          const SizedBox(height: 10),
          Text(
            user?.company ?? '',
            style: AppTextTheme.textPrimary,
          ),
          const SizedBox(height: 40),
          Container(
            decoration: const BoxDecoration(
                // color: Colors.pink,
                // border: Border.all(
                //   // color: AppColor.blue,
                //   width: 3,
                // ),
                // borderRadius: BorderRadius.circular(AppConfig.defaultRadius),
                ),
            // width: 100,
            // height: 100,
            child: SvgPicture.asset(Assets.icSetting),
          ),
        ],
      ),
    );
  }
}
