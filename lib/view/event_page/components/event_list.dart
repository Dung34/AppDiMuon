// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../data/resources/themes.dart';
// import '../../../shared/widgets/list_view/animation_listview.dart';
// import '../../../shared/widgets/something/no_data.dart';
// import '../cubit/event_cubit.dart';
// import 'event_list_shimmer.dart';

// class EventList extends StatelessWidget {
//   final EventCubit eventCubit;
//   final int type;

//   const EventList({super.key, required this.eventCubit, required this.type});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: eventCubit..getAllEvent(),
//       child: BlocBuilder<EventCubit, EventState>(
//         buildWhen: (previous, current) =>
//             current is EventGetAllEventSuccessState,
//         builder: (context, state) {
//           if (state is EventGetAllEventSuccessState) {
//             final eventWrappers = state.eventWrappers;
//             if (eventWrappers.isNotEmpty) {
//               final items = List.generate(eventWrappers.length, (index) {
//                 final eventWrapper = eventWrappers[index];
//                 return Column(
//                   children: [
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             eventWrapper.title ?? '',
//                             style: AppTextTheme.lexendBold18
//                                 .copyWith(overflow: TextOverflow.ellipsis),
//                           ),
//                         ),
//                       ],
//                     ),
//                     // if (eventWrapper.events!.isNotEmpty)
//                     //   PrimaryCarousel(
//                     //     data: const [],
//                     //     aspectRatio: MediaQuery.of(context).devicePixelRatio,
//                     //     height: (context.screenWidth * 0.7 - 16) * 9 / 16 + 150,
//                     //     viewportFraction: 0.7,
//                     //     items: eventWrapper.events!
//                     //         .map((e) => EventItem(event: e))
//                     //         .toList(),
//                     //     autoPlay: false,
//                     //     showIndicator: false,
//                     // ),
//                     if (index == eventWrappers.length - 1)
//                       const SizedBox(height: 100),
//                   ],
//                 );
//               });
//               return AnimationStaggeredListView(
//                 items: items,
//               );
//             } else {
//               return const NoData();
//             }
//           } else if (state is EventGetAllEventFailedState) {
//             return const NoData();
//           } else {
//             return const EventListShimmer();
//           }
//         },
//       ),
//     );
//   }
// }
