// import 'package:ana/core/app_assets.dart';
// import 'package:ana/screens/contraction_timer/data/contraction_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class AnimatedListExample extends StatefulWidget {
//   @override
//   _AnimatedListExampleState createState() => _AnimatedListExampleState();
// }

// class _AnimatedListExampleState extends State<AnimatedListExample> {
//   final GlobalKey<AnimatedListState> _listKey = GlobalKey();
//   final List<String> _items = [];
//   final List<ContractionModel> _displayList = [];
//   int _counter = 0;

//   void _addItem() {
//     _items.insert(0, 'Кітап ${++_counter}');
//     _displayList.insert(
//         0,
//         ContractionModel(
//             count: ++_counter,
//             contractionDuration: Duration(seconds: _counter),
//             intervalDuration: Duration(seconds: _counter)));
//     _listKey.currentState?.insertItem(0, duration: Duration(milliseconds: 600));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Scroll + Анимация')),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addItem,
//         child: Icon(Icons.add),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 64),
//         child: AnimatedList(
//           key: _listKey,
//           initialItemCount: _displayList.length,
//           reverse: false,
//           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
//           itemBuilder: (context, index, animation) {
//             return SizeTransition(
//               sizeFactor: CurvedAnimation(
//                 parent: animation,
//                 curve: Curves.easeOut,
//               ),
//               axisAlignment: 0.0,
//               child: FadeTransition(
//                 opacity: CurvedAnimation(
//                   parent: animation,
//                   curve: Curves.easeInOut,
//                 ),
//                 child: counterIconWithConnector(index, _displayList),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget animatedListElement(int index, List<ContractionModel> items) {
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
//           "$index",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
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
//           "$index",
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
