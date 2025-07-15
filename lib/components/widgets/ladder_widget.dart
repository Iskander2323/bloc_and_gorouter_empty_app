// import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 10),
//       alignment: Alignment.topCenter,
//       height: MediaQuery.of(context).size.height * 0.6,
//       child: ListView.builder(
//         itemCount:
//             state.contractionModelList.isEmpty
//                 ? 1
//                 : state.contractionModelList.length + 1,
//         itemBuilder: (context, index) {
//           if (index == 0) {
//             final showInterval =
//                 !state.isContractionTimerRunning && !state.isFirstContraction;
//             return Container(
//               //color: Colors.amber,
//               alignment: Alignment.center,
//               padding: const EdgeInsets.only(bottom: 32),
//               child: Stack(
//                 alignment: Alignment.center,
//                 clipBehavior: Clip.none,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(top: 30),
//                     //color: Colors.blue,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 45,
//                           child: StreamBuilder(
//                             stream: _contractionTimer.rawTime,
//                             initialData: 0,
//                             builder: (context, snap) {
//                               final value = snap.data ?? 0;
//                               final displayTime = StopWatchTimer.getDisplayTime(
//                                 value,
//                                 hours: false,
//                                 milliSecond: false,
//                               );
//                               return Text(
//                                 displayTime,
//                                 style: text500Size14Black,
//                                 textAlign: TextAlign.center, // ортасына келтіру
//                                 softWrap: false,
//                                 overflow: TextOverflow.visible,
//                               );
//                             },
//                           ),
//                         ),
//                         Positioned(
//                           right: 5,
//                           child: counterWithIcon(
//                             svgAssetPath: AppAssets.counter_circle,
//                             countText:
//                                 "${state.contractionModelList.length + 1 - index}",
//                           ),
//                         ),
//                         const SizedBox(width: 48),
//                       ],
//                     ),
//                   ),
//                   if (showInterval)
//                     Positioned(
//                       right: 62,
//                       bottom: 52,
//                       child: StreamBuilder(
//                         stream: _intervalTimer.rawTime,
//                         initialData: 0,
//                         builder: (context, snap) {
//                           final value = snap.data ?? 0;
//                           final displayTime = StopWatchTimer.getDisplayTime(
//                             value,
//                             hours: false,
//                             milliSecond: false,
//                           );
//                           return Text(displayTime, style: text500Size14Black);
//                         },
//                       ),
//                     ),
//                 ],
//               ),
//             );
//           } else {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 32),
//               child: Stack(
//                 alignment: Alignment.center,
//                 clipBehavior: Clip.none,
//                 children: [
//                   Container(
//                     // color: Colors.amber,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           _formatDuration(
//                             state
//                                 .contractionModelList[state
//                                         .contractionModelList
//                                         .length -
//                                     index]
//                                 .contractionDuration,
//                           ),
//                           style: text500Size14Black,
//                         ), // немесе нақты мән
//                         counterWithIcon(
//                           svgAssetPath: AppAssets.counter_circle,
//                           countText:
//                               "${state.contractionModelList.length + 1 - index}",
//                         ),
//                         const SizedBox(
//                           width: 45,
//                         ), // Интервалға бос орын қалдырамыз
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     right: 62,
//                     bottom: 52, // Жоғарыда орналасуы үшін
//                     child: Text(
//                       _formatDuration(
//                         state
//                             .contractionModelList[state
//                                     .contractionModelList
//                                     .length -
//                                 index]
//                             .intervalDuration,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
