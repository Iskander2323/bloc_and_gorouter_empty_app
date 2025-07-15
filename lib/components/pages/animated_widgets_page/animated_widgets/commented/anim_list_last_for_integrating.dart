// import 'package:ana/core/app_assets.dart';
// import 'package:ana/core/text_styles.dart';
// import 'package:ana/screens/contraction_timer/bloc/contraction_timer_bloc.dart';
// import 'package:ana/screens/contraction_timer/data/contraction_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';

// class AnimatedListIntegrated extends StatefulWidget {
//   final List<ContractionModel> sessionsList;
//   final StopWatchTimer contractionTimer;
//   final StopWatchTimer intervalTimer;

//   const AnimatedListIntegrated(
//       {super.key,
//       required this.sessionsList,
//       required this.contractionTimer,
//       required this.intervalTimer});
//   @override
//   _AnimatedListIntegratedState createState() => _AnimatedListIntegratedState();
// }

// class _AnimatedListIntegratedState extends State<AnimatedListIntegrated> {
//   final GlobalKey<AnimatedListState> _listKey = GlobalKey();
//   List<ContractionModel> _displayedList = [];
//   @override
//   void initState() {
//     super.initState();
//     _displayedList = List.from(widget.sessionsList);
//   }

//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return "$minutes:$seconds";
//   }

//   @override
//   void didUpdateWidget(covariant AnimatedListIntegrated oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     final newList = widget.sessionsList;
//     // Егер жаңа элемент қосылса
//     if (newList.length > oldWidget.sessionsList.length) {
//       final added = newList.last;
//       _displayedList.add(added);
//       //_displayedList.insert(0, added);
//       _listKey.currentState?.didChangeDependencies();
//       _listKey.currentState
//           ?.insertItem(0, duration: const Duration(milliseconds: 500));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ContractionTimerBloc, ContractionTimerState>(
//       listenWhen: (previous, current) => previous.contractionModelList.length != current.contractionModelList.length,
//       listener: (context, state) {
//     //      if (newList.length > oldWidget.sessionsList.length) {
//     //   final added = newList.last;
//     //   _displayedList.add(added);
//     //   //_displayedList.insert(0, added);
//     //   _listKey.currentState?.didChangeDependencies();
//     //   _listKey.currentState
//     //       ?.insertItem(0, duration: const Duration(milliseconds: 500));
//     // }

//      final newDataList= state.contractionModelList;
//           if (newDataList.length > _displayedList.length) {
//             final addedMessage = newDataList.last;
//             _displayedList.insert(0, addedMessage);
//             _listKey.currentState?.insertItem(0, duration: const Duration(milliseconds: 500));
//           }
//       },
//       builder: (context, state) {
//         return Scaffold(
//          appBar: AppBar(title: Text("Animated List"),),
//           body: Container(
//             height: MediaQuery.of(context).size.height * 0.6,
//             color: Colors.blue,
//             child: AnimatedList(
//               key: _listKey,
//               initialItemCount: _displayedList.length,
//               reverse: false,
//               padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
//               itemBuilder: (context, index, animation) {
//                 return SizeTransition(
//                   sizeFactor: CurvedAnimation(
//                     parent: animation,
//                     curve: Curves.easeOut,
//                   ),
//                   axisAlignment: 0.0,
//                   child: FadeTransition(
//                     opacity: CurvedAnimation(
//                       parent: animation,
//                       curve: Curves.easeInOut,
//                     ),
//                     child: counterIconWithConnector(index, _displayedList),
//                   ),
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget animatedListElement(int index, List<ContractionModel> displayedList,
//       bool isContractionTimerRunning, bool isFirstContraction) {
//     if (index == 0) {
//       final showInterval = !isContractionTimerRunning && !isFirstContraction;
//       return Container(
//         color: Colors.amber,
//         alignment: Alignment.center,
//         padding: const EdgeInsets.only(bottom: 32),
//         child: Stack(
//           alignment: Alignment.center,
//           clipBehavior: Clip.none,
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 30),
//               color: Colors.blue,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 45,
//                     child: StreamBuilder(
//                       stream: widget.contractionTimer.rawTime,
//                       initialData: 0,
//                       builder: (context, snap) {
//                         final value = snap.data ?? 0;
//                         final displayTime = StopWatchTimer.getDisplayTime(
//                           value,
//                           hours: false,
//                           milliSecond: false,
//                         );
//                         return Text(
//                           displayTime,
//                           style: text500Size14Black,
//                           textAlign: TextAlign.center, // ортасына келтіру
//                           softWrap: false,
//                           overflow: TextOverflow.visible,
//                         );
//                       },
//                     ),
//                   ),
//                   Positioned(
//                     right: 5,
//                     child: counterIconWithConnector(index,
//                         displayedList // "${state.contractionModelList.length + 1 - index}",
//                         ),
//                   ),
//                   const SizedBox(width: 48),
//                 ],
//               ),
//             ),
//             if (showInterval)
//               Positioned(
//                 right: 62,
//                 bottom: 52,
//                 child: StreamBuilder(
//                   stream: widget.intervalTimer.rawTime,
//                   initialData: 0,
//                   builder: (context, snap) {
//                     final value = snap.data ?? 0;
//                     final displayTime = StopWatchTimer.getDisplayTime(value,
//                         hours: false, milliSecond: false);
//                     return Text(
//                       displayTime,
//                       style: text500Size14Black,
//                     );
//                   },
//                 ),
//               ),
//           ],
//         ),
//       );
//     } else {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 32),
//         child: Stack(
//           alignment: Alignment.center,
//           clipBehavior: Clip.none,
//           children: [
//             Container(
//               // color: Colors.amber,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     _formatDuration(displayedList[displayedList.length - index]
//                         .contractionDuration),
//                     style: text500Size14Black,
//                   ), // немесе нақты мән
//                   counterIconWithConnector(index, displayedList),
//                   const SizedBox(width: 45), // Интервалға бос орын қалдырамыз
//                 ],
//               ),
//             ),
//             Positioned(
//               right: 62,
//               bottom: 52, // Жоғарыда орналасуы үшін
//               child: Text(_formatDuration(
//                   displayedList[displayedList.length - index]
//                       .intervalDuration)),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   Widget counterIconWithConnector(int index, List<ContractionModel> items) {
//     var asset = AppAssets.counter_with_connectors;
//     if (index + 1 == items.length) {
//       if (index == 0 && items.length == 1) {
//         asset = AppAssets.circle;
//       } else {
//         asset = AppAssets.last_counter;
//       }
//       //asset = AppAssets.last_counter;
//     } else if (index == 0) {
//       asset = AppAssets.first_counter;
//     }
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           height: index == 0 && items.length == 1 ? 47 : 63, //63
//           alignment: Alignment.center,
//           child: SvgPicture.asset(
//             asset,
//             width: 40, //70
//             height: 65, //65
//           ),
//         ),
//         Text(
//           " ${items.length + 1 - index}",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
// }
