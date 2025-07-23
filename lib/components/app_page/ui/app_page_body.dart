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
        actions: [
           PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert), // you can use any ico
             shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20), // Make it more circular
  ),
            onSelected: (String value) {
              
              // Handle selected value
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: $value')),
              );
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(

                value: 'profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(16.0),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const Text('Widgets go here'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('widgets_page');
                },
                child: const Text('Press Me'),
              ),
              SizedBox(height: 20),
              const Text('Text Widgets'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('text_widgets_page');
                },
                child: const Text('Press Me'),
              ),
              SizedBox(height: 20),
              const Text('List View Page'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('list_view_page');
                },
                child: const Text('Press Me'),
              ),
              SizedBox(height: 20),
              const Text('Grid View Page'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('grid_view_page');
                },
                child: const Text('Press Me'),
              ),
              SizedBox(height: 20),
              const Text('Animated Widgets Page'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('animated_widgets_page');
                },
                child: const Text('Press Me'),
              ),
              const Text('Scaffold page'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('scaffold_page');
                },
                child: const Text('Press Me'),
              ),
               const Text('Custom Scroll View page'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('custom_scroll_view_example');
                },
                child: const Text('Press Me'),
              ),
               const Text('Show Case View Guide'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('show_case_view_page');
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
