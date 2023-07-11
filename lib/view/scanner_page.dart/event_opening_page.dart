import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/shimmer/event_list_shimmer.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import '../event_page/components/event_item.dart';
import '../event_page/cubit/event_cubit.dart';

class EventOpeningPage extends StatefulWidget {
  const EventOpeningPage({super.key});

  @override
  State<EventOpeningPage> createState() => _EventOpeningPageState();
}

class _EventOpeningPageState
    extends BasePageState<EventOpeningPage, EventCubit> {
  @override
  void initState() {
    super.initState();
    cubit.getAllEvent(isOpening: false);
  }

  @override
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  PreferredSizeWidget? get appBar => PrimaryAppBar(
        title: 'Sự kiện đang diễn ra',
      );

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<EventCubit, EventState>(
            builder: (context, state) {
              if (state is EventGetAllEventSuccessState) {
                final events = state.events;
                return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return EventItem(
                      event: events[index],
                      inCheckInPage: true,
                    );
                  },
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: EventListShimmer(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
