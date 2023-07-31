import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../shared/etx/view_ext.dart';
import '../../shared/widgets/shimmer/event_member_item_shimmer.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import 'components/event_member_item.dart';
import 'cubit/event_cubit.dart';

class EventMemberPage extends StatefulWidget {
  const EventMemberPage({super.key});

  @override
  State<EventMemberPage> createState() => _EventMemberPageState();
}

class _EventMemberPageState extends BasePageState<EventMemberPage, EventCubit> {
  @override
  void initState() {
    super.initState();
    setAppBar = PrimaryAppBar(
      title: 'Thành viên tham gia',
      actions: const [
        // IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.icSearch)),
      ],
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    final args = context.arguments as EventMemberPageArgs;
    cubit.getAllCheckedInMember(args.eventId);
    return BlocBuilder<EventCubit, EventState>(
      buildWhen: (previous, current) {
        return current is EventGetAllMemberSuccessState;
      },
      builder: (context, state) {
        if (state is EventGetAllMemberSuccessState) {
          final eventMembers = state.eventMembers;
          if (eventMembers.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final eventMember = eventMembers[index];
                return EventMemberItem(eventMember: eventMember);
              },
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              itemCount: eventMembers.length,
            );
          } else {
            return const NoData();
          }
        } else {
          return const EventMemberItemShimmer(
            showAvatar: false,
          );
        }
      },
    );
  }
}
