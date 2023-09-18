import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/user/user.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/widgets/button/back_button.dart';
import '../../../shared/widgets/image/primary_circle_image.dart';
import '../../../shared/widgets/image/primary_image.dart';
import '../../../shared/widgets/something/loading.dart';
import '../../../shared/widgets/something/user_role_badge.dart';
import '../../base/base_page_sate.dart';
import '../../base/bloc/user/user_cubit.dart';

class ProfileViewHeader extends StatefulWidget {
  final Widget child;
  final bool canPop;

  /// id user id is null, this is current user
  final String? userId;
  const ProfileViewHeader(
      {super.key, required this.child, this.userId, this.canPop = false});

  @override
  State<StatefulWidget> createState() => _ProfileViewHeaderState();
}

class _ProfileViewHeaderState
    extends BasePageState<ProfileViewHeader, UserCubit> {
  late UserEntity user;

  @override
  bool get useSafeArea => false;

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  bool get useBlocProviderValue => widget.userId == null;

  @override
  void initState() {
    super.initState();
    if (widget.userId != null) {
      setCubit = UserCubit();
    } else {
      setCubit = context.read<UserCubit>();
    }

    cubit.getUser(userId: widget.userId);
    _scrollController.addListener(_scrollListener);
  }

  final ScrollController _scrollController = ScrollController();
  bool lastStatus = true;
  double expandedHeight = 0;

  bool get _isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (expandedHeight - kToolbarHeight);
  }

  _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    expandedHeight = context.screenWidth * 9 / 16;
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          BlocBuilder<UserCubit, UserState>(
            buildWhen: (previous, current) =>
                current is UserGetUserSuccessState,
            builder: (context, state) {
              if (state is UserGetUserSuccessState) {
                user = state.userEntity;
                return SliverAppBar(
                  backgroundColor: _isShrink
                      ? AppColor.primaryBackgroundColor
                      : AppColor.transparent,
                  elevation: 0,
                  expandedHeight: expandedHeight,

                  shadowColor: Colors.black.withOpacity(0.25),
                  forceElevated: true,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1.2,
                    titlePadding: const EdgeInsets.only(left: 0, bottom: 16),
                    title: _isShrink
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                if (widget.canPop) const BackButtonCustom(),
                                // PrimaryCircleImage(
                                //   radius: 20,
                                //   imageUrl: user.avatar ?? '',
                                // ),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: Text(
                                  user.firstName ?? '',
                                  style: AppTextTheme.robotoMedium16,
                                )),
                              ],
                            ),
                          )
                        : Container(
                            alignment: Alignment.bottomCenter,
                            width: context.screenWidth,
                            height: expandedHeight,
                            child: Stack(
                              children: [
                                // Container(
                                //   alignment: Alignment.bottomCenter,
                                //   height: expandedHeight,
                                //   child: PrimaryNetworkImage(
                                //     imageUrl: user.coverImage,
                                //     width: context.screenWidth,
                                //     height: expandedHeight,
                                //   ),
                                // ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: AppColor.coverImageGradient,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 16,
                                  bottom: 16,
                                  right: 16,
                                  child: Container(
                                    width: context.screenWidth,
                                    height: expandedHeight,
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      children: [
                                        // CircleAvatar(
                                        //   radius: 56,
                                        //   backgroundColor: AppColor.white,
                                        //   child: PrimaryCircleImage(
                                        //     radius: 50,
                                        //     imageUrl: user.avatar ?? '',
                                        //   ),
                                        // ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                user.firstName ?? '',
                                                style: AppTextTheme.robotoBold20
                                                    .copyWith(
                                                        color:
                                                            AppColor.neutral10),
                                                maxLines: 2,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              UserRoleBadge(
                                                type: user.role!,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                  pinned: true,
                  // floating: true,
                  // snap: true,
                  automaticallyImplyLeading: widget.canPop,
                  centerTitle: false,
                );
              } else {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: context.screenHeight,
                    child: const Center(
                      child: Loading(),
                    ),
                  ),
                );
              }
            },
          )
        ];
      },
      body: widget.child,
    );
  }
}
