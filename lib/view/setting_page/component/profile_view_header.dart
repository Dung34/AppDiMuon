import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/user/user.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/widgets/button/back_button.dart';
import '../../../shared/widgets/image/primary_circle_image.dart';
import '../../../shared/widgets/image/primary_image.dart';
import '../../../shared/widgets/something/loading.dart';
import '../../base/base_page_sate.dart';
import '../../base/bloc/user/user_cubit.dart';

class ProfileViewHeader extends StatefulWidget {
  final Widget child;

  /// id user id is null, this is current user
  final String? userId;
  const ProfileViewHeader({super.key, required this.child, this.userId});

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
  UserCubit get cubit => widget.userId != null ? UserCubit() : super.cubit;

  @override
  bool get useBlocProviderValue => widget.userId == null;

  @override
  void initState() {
    super.initState();
    cubit.getUser(userId: widget.userId);
    // cubit.getProfileOverView();
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
                                const BackButtonCustom(),
                                PrimaryCircleImage(
                                  radius: 20,
                                  imageUrl: user.avatar ?? '',
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: Text(
                                  user.fullname ?? '',
                                  style: AppTextTheme.robotoMedium16,
                                )),
                              ],
                            ),
                          )
                        : Container(
                            alignment: Alignment.bottomCenter,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20.0),
                              ),
                            ),
                            width: context.screenWidth,
                            height: expandedHeight,
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  height: expandedHeight,
                                  child: PrimaryNetworkImage(
                                    imageUrl: user.coverImage,
                                    width: context.screenWidth,
                                    height: expandedHeight,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
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
                                  child: SizedBox(
                                    width: context.screenWidth,
                                    height: expandedHeight + kToolbarHeight,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 56,
                                            backgroundColor: AppColor.white,
                                            child: PrimaryCircleImage(
                                              radius: 50,
                                              imageUrl: user.avatar ?? '',
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Text(
                                              user.fullname ?? '',
                                              style: AppTextTheme.robotoBold24
                                                  .copyWith(
                                                overflow: TextOverflow.ellipsis,
                                                color: AppColor.white,
                                              ),
                                              maxLines: 2,
                                            ),
                                          )
                                        ],
                                      ),
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
                  automaticallyImplyLeading: false,
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
