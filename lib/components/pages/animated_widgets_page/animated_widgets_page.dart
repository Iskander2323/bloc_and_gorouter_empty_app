import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimatedWidgetsPage extends StatelessWidget {
  const AnimatedWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Widgets Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Animated Widgets will be displayed here'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.goNamed('animated_list_1');

              },
              child: const Text('Size Transition Animated List Widget'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.goNamed('animated_list_2');
              },
              child: const Text('Fade Transition Animated List Widget'),
            ),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.goNamed('animated_list_3');
              },
              child: const Text('Slide Transition Animated List Widget'),
            ),
              SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.goNamed('animated_list_4');
              },
              child: const Text('Scale Transition Animated List Widget'),
            ),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.goNamed('animated_list_5');
              },
              child: const Text('Rotation Transition Animated List Widget'),
            ),
          ],
        ),
      ),
    );
  }
}