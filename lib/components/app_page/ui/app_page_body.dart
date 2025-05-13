import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppPageBody extends StatefulWidget {
  const AppPageBody({super.key});

  @override
  State<AppPageBody> createState() => _AppPageBodyState();
}

class _AppPageBodyState extends State<AppPageBody> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Page'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Widgets go here'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('widgets_page');
                },
                child: const Text('Press Me'),
              ),
              const Text('List View Page'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('list_view_page');
                },
                child: const Text('Press Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
