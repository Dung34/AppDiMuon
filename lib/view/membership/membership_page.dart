import 'package:flutter/material.dart';

import '../../data/resources/resources.dart';
import '../../shared/etx/app_ext.dart';
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
            height: 340,
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
                    height: 300,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 20 + MediaQuery.of(context).padding.top,
                  child: Image.asset(
                    Assets.imAppLogoHorizontalWhite,
                    height: 56,
                  ),
                ),
                Positioned(
                  left: context.screenWidth / 2 - 86,
                  top: 300 * 3 / 4 - 86,
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
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            user?.role == 1 ? 'ADMIN' : 'Người dùng',
            style: AppTextTheme.robotoMedium18.copyWith(
              color: AppColor.primary500,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Text(
                user?.avatar ?? '',
                style: AppTextTheme.lexendBold30,
              ),
              SizedBox(
                width: context.screenWidth / 2.5,
                child: const Divider(
                  thickness: 2,
                  color: AppColor.secondary400,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          // Text(
          //   user?.company ?? '',
          //   style: AppTextTheme.robotoLight18,
          // ),
          // const SizedBox(height: 16),
          // PrimaryQrView(
          //     data: '${Environment.domain}/profile/${user?.username}'),
          // const SizedBox(height: 80),
        ],
      ),
    );
  }
}
