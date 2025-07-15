// // Бұл виджет ContractionModel тізімі өзгерген сайын AnimatedList арқылы көрсетеді
// // Жаңа мәлімет қосылғанда - анимациямен шығады
// // Төменге өткен элементтер төмен сырғып анимациямен шығады

// import 'package:ana/core/app_assets.dart';
// import 'package:ana/core/text_styles.dart';
// import 'package:ana/screens/contraction_timer/data/contraction_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';

// // Бұл виджет ContractionModel тізімі өзгерген сайын AnimatedList арқылы көрсетеді
// // Жаңа мәлімет қосылғанда - анимациямен шығады
// // Төменге өткен элементтер төмен сырғып анимациямен шығады

// // Animated Contraction Sessions List
// // ContractionModel тізімі өзгереді: жаңа сеанс үстіне қосылады

// class ContractionAnimatedList extends StatefulWidget {
//   final List<ContractionModel> sessionList;
//   final bool isContractionTimerRunning;
//   final bool isFirstContraction;
//   final StopWatchTimer contractionTimer;
//   final StopWatchTimer intervalTimer;

//   const ContractionAnimatedList({
//     super.key,
//     required this.sessionList,
//     required this.isContractionTimerRunning,
//     required this.isFirstContraction,
//     required this.contractionTimer,
//     required this.intervalTimer,
//   });

//   @override
//   State<ContractionAnimatedList> createState() =>
//       _ContractionAnimatedListState();
// }

// class _ContractionAnimatedListState extends State<ContractionAnimatedList> {
//   final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
//   late List<ContractionModel> _displayedList;

//   Widget _buildPastSession(
//       ContractionModel model, int index, Animation<double> anim) {
//     return SizeTransition(
//       sizeFactor: anim,
//       axisAlignment: -1.0,
//       child: Container(
//         alignment: Alignment.center,
//         color: Colors.amber,
//         padding: const EdgeInsets.only(top: 25),
//         child: Stack(
//           alignment: Alignment.center,
//           clipBehavior: Clip.none,
//           children: [
//             Container(
//              // color: Colors.blue,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     _formatDuration(model.contractionDuration),
//                     style: text500Size14Black,
//                   ),
//                   counterWithIcon(
//                     svgAssetPath: AppAssets.counter_circle,
//                     countText: "${_displayedList.length - index}",
//                   ),
//                   const SizedBox(width: 48),
//                 ],
//               ),
//             ),
//             Positioned(
//               right: 62,
//               bottom: 50,
//               child: Text(
//                 _formatDuration(model.intervalDuration),
//                 style: text500Size14Black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _formatDuration(Duration d) {
//     final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
//     final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
//     return "$m:$s";
//   }

//   Widget _buildCurrentSession(Animation<double> anim) {
//     final showInterval =
//         !widget.isContractionTimerRunning && !widget.isFirstContraction;

//     return SizeTransition(
//       sizeFactor: anim,
//       axisAlignment: -1.0,
//       child: Container(
//         //height: 80,
//         padding: EdgeInsets.only(top: 25),
//        // color: Colors.pinkAccent,
//         child: Stack(
//           alignment: Alignment.center,
//           clipBehavior: Clip.none,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 StreamBuilder<int>(
//                   stream: widget.contractionTimer.rawTime,
//                   initialData: 0,
//                   builder: (context, snap) {
//                     final value = snap.data ?? 0;
//                     final display = StopWatchTimer.getDisplayTime(
//                       value,
//                       hours: false,
//                       milliSecond: false,
//                     );
//                     return Text(
//                       display,
//                       style: text500Size14Black,
//                       textAlign: TextAlign.center,
//                       softWrap: false,
//                       overflow: TextOverflow.ellipsis,
//                     );
//                   },
//                 ),
//                 counterWithIcon(
//                   svgAssetPath: AppAssets.counter_circle,
//                   countText: "${_displayedList.length + 1}",
//                 ),
//                 const SizedBox(width: 48),
//               ],
//             ),
//             if (showInterval)
//               Positioned(
//                 right: 62,
//                 bottom: 50,
//                 child: SizedBox(
//                   width: 60,
//                   child: StreamBuilder<int>(
//                     stream: widget.intervalTimer.rawTime,
//                     initialData: 0,
//                     builder: (context, snap) {
//                       final value = snap.data ?? 0;
//                       final display = StopWatchTimer.getDisplayTime(
//                         value,
//                         hours: false,
//                         milliSecond: false,
//                       );
//                       return Text(
//                         display,
//                         style: text500Size14Black,
//                         textAlign: TextAlign.center,
//                       );
//                     },
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//     Widget counterWithConnector(
//       {required String countText}) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         // Артқы SVG иконка
//         SvgPicture.asset(
//           AppAssets.counter_with_connector,
//           width: 47,
//           height: 47,
//         ),

//         // Ортасындағы динамикалық текст
//         Text(
//           countText,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget counterWithIcon(
//       {required String svgAssetPath, required String countText}) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         // Артқы SVG иконка
//         SvgPicture.asset(
//           AppAssets.counter_circle,
//           width: 47,
//           height: 47,
//         ),

//         // Ортасындағы динамикалық текст
//         Text(
//           countText,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Бастапқы тізімді күйден көшіру
//     _displayedList = List.from(widget.sessionList);
//   }

//   @override
//   void didUpdateWidget(covariant ContractionAnimatedList oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     final newList = widget.sessionList;
//     // Егер жаңа элемент қосылса
//     if (newList.length > oldWidget.sessionList.length) {
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
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.6,
//       child: AnimatedList(
//         key: _listKey,
//         initialItemCount: _displayedList.length + 1,
//         itemBuilder: (context, index, animation) {
//           if (index == 0) {
//             return _buildCurrentSession(animation);
//           } else {
//             final reversedList = _displayedList.reversed.toList();
//             return _buildPastSession(
//                 reversedList[index - 1], index - 1, animation);
//           }
//         },
//       ),
//     );
//   }
// }
