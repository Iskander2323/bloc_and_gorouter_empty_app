// import 'package:ana/core/app_assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class PulsatingButton extends StatefulWidget {
//   final bool isRunning;
//   const PulsatingButton({super.key, required this.isRunning});

//   @override
//   State<PulsatingButton> createState() => _PulsatingButtonState();
// }

// class _PulsatingButtonState extends State<PulsatingButton>
//     with TickerProviderStateMixin {
//   late AnimationController _heartController;
//   late AnimationController _scaleController;
//   late AnimationController _rippleController;

//   late Animation<double> _heartOpacity;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _rippleOpacity;
//   late Animation<double> _rippleScale;

//   @override
//   void initState() {
//     super.initState();

//     // Жүрек жыпылықтауы
//     _heartController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 700));
//     _heartOpacity = Tween(begin: 1.0, end: 0.0).animate(_heartController);

//     // Дөңгелек масштаб анимациясы
//     _scaleController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 1600));
//     _scaleAnimation = TweenSequence([
//       TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.07).chain(CurveTween(curve: Curves.easeInOut)), weight: 1),
//       TweenSequenceItem(tween: Tween(begin: 1.07, end: 0.92).chain(CurveTween(curve: Curves.easeInOut)), weight: 1),
//       TweenSequenceItem(tween: Tween(begin: 0.92, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)), weight: 1),
//     ]).animate(_scaleController);

//         // .animate(CurvedAnimation(
//         // parent: _scaleController, curve: Curves.linear //easeInOut
//         // ));

//     // Ripple көлеңке эффектісі
//     _rippleController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 1600));
 
//     _rippleOpacity = TweenSequence([
//       TweenSequenceItem(tween: Tween(begin: 0.3, end: 0.0).chain(CurveTween(curve: Curves.easeInOut)), weight: 1),
//       TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.12).chain(CurveTween(curve: Curves.easeInOut)), weight: 1),
//       TweenSequenceItem(tween: Tween(begin: 0.12, end: 0.3).chain(CurveTween(curve: Curves.easeInOut)), weight: 1),]).animate(_rippleController);

//     _rippleScale = TweenSequence([
//       TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.25).chain(CurveTween(curve: Curves.easeInOut)), weight: 1),
//       TweenSequenceItem(tween: Tween(begin: 1.25, end: 1.08).chain(CurveTween(curve: Curves.easeInOut)), weight: 1),
//       TweenSequenceItem(tween: Tween(begin: 1.08, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)), weight: 1),
//     ]).animate(_rippleController);
//   }

//   @override
//   void dispose() {
//     _heartController.dispose();
//     _scaleController.dispose();
//     _rippleController.dispose();
//     super.dispose();
//   }

//   @override
//   void didUpdateWidget(covariant PulsatingButton oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     if (widget.isRunning && !oldWidget.isRunning) {
//       // ТАЙМЕР БАСТАЛДЫ — АНИМАЦИЯЛАР БАСТАЛАДЫ
//       _heartController.forward(); // opacity 1.0 -> 0.0 -> 1.0
//       _heartController.repeat(reverse: true);

//       _scaleController.forward();
//       _scaleController.repeat();

//       _rippleController.forward();
//       _rippleController.repeat();
//     } else if (!widget.isRunning && oldWidget.isRunning) {
//       // ТАЙМЕР ТОҚТАДЫ — ПЛАВНО СОҢЫНА ЖЕТЕДІ
//       _heartController
//           .animateTo(0.0,
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeOutSine)
//           .then((_) {
//         _heartController.stop();
//         _heartController.reset(); // opacity толық 1.0
//       });

//       _scaleController
//           .animateBack(1.0,
//               duration: const Duration(milliseconds: 400),
//               curve: Curves.easeOutSine)
//           .then((_) {
//         _scaleController.stop();
//         _scaleController.reset(); // scale толық 1.0
//       });

//       _rippleController
//           .animateTo(1.0,
//               duration: const Duration(milliseconds: 600),
//               curve: Curves.easeOutSine)
//           .then((_) {
//         _rippleController.stop();
//         _rippleController.reset(); // ripple сыртқа шығып жойылады
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         // Ripple effect
//         AnimatedBuilder(
//           animation: _rippleController,
//           builder: (context, child) => Opacity(
//             opacity: _rippleOpacity.value,
//             child: Transform.scale(
//               scale: _rippleScale.value,
//               child: Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: const Color(0xffCBA8F0),
//                 ),
//               ),
//             ),
//           ),
//         ),

//         // Scale effect
//         AnimatedBuilder(
//           animation: _scaleController,
//           builder: (context, child) => Transform.scale(
//             scale: _scaleAnimation.value,
//             child: Container(
//               width: 102,
//               height: 102,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xffCBA8F0),
//               ),
//             ),
//           ),
//         ),

//         // Heart icon fade
//         AnimatedBuilder(
//           animation: _heartOpacity,
//           builder: (context, child) => Opacity(
//             opacity: _heartOpacity.value,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 4),
//               child: SvgPicture.asset(
//                 AppAssets.contraction_timer_inside_button_heart,
//                 width: 40,
//                 height: 40,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
