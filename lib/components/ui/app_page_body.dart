import 'package:flutter/material.dart';

class AppPageBody extends StatefulWidget {
  const AppPageBody({super.key});

  @override
  State<AppPageBody> createState() => _AppPageBodyState();
}

class _AppPageBodyState extends State<AppPageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Page')),
      body: Center(
        child: Text(
          'This is the App Page Body',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
