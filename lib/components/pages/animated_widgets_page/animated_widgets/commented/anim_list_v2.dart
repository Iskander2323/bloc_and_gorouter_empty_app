// import 'package:ana/core/app_assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class SlideFromUnder extends StatefulWidget {
//   @override
//   State<SlideFromUnder> createState() => _SlideFromUnderState();
// }

// class _SlideFromUnderState extends State<SlideFromUnder> {
//   final List<String> _items = [];
//   int _counter = 0;
//   final double _itemHeight = 50;
//   final double _topOffset = 100;

//   void _addItem() {
//     setState(() {
//       _items.insert(0, 'Кітап ${++_counter}');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double totalHeight = 500;

//     return Scaffold(
//       appBar: AppBar(title: const Text('Үстіңгі кітап қозғалмайды')),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addItem,
//         child: const Icon(Icons.add),
//       ),
//       body: Center(
//         child: SizedBox(
//           height: totalHeight,
//           width: double.infinity,
//           child: Stack(
//             children: [
//               // Астынан сырғып шығатын кітаптар
//               for (int i = 0; i < _items.length; i++)
//                 AnimatedPositioned(
//                   key: ValueKey(_items[i]),
//                   duration: const Duration(milliseconds: 500),
//                   top: _topOffset + (i * (_itemHeight + 8)),
//                   left: 40,
//                   right: 40,
//                   child: counterIconWithConnector(i),
//                 ),

//               // Ең үстіңгі қозғалмайтын кітап
//               Positioned(
//                 top: 120,
//                 left: 40,
//                 right: 40,
//                 child: counterWithIcon(1)
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget counterIconWithConnector(int index) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         // Артқы SVG иконка
//         Container(
//           alignment: Alignment.center,
//           height: 63,
//           child: Positioned(
//             //bottom: 20,
//             child: Container(
//               alignment: Alignment.center,
//             //  color: Colors.amber,
//               // height: 100,
//               // width: 100,
//               child: SvgPicture.asset(
//                 AppAssets.counter_with_connector,
//                 width: 70,
//                 height: 65,
//               ),
//             ),
//           ),
//         ),

//         // Ортасындағы динамикалық текст
//         Positioned(
//           top: 28,
//           child: Text(
//             "${index}",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }


//   Widget counterWithIcon(int index) {
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
//           "${index}",
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