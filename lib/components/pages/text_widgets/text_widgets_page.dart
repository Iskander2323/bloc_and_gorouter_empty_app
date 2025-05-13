import 'package:bloc_and_go_router_empty_app/components/widgets/text_widgets/description_text.dart';
import 'package:bloc_and_go_router_empty_app/components/widgets/text_widgets/header_text.dart';
import 'package:flutter/material.dart';

class TextWidgetsPage extends StatelessWidget {
  const TextWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Widgets Page')),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              HeaderText('Header Text'),
              DescriptionText('Description Text'),
            ],
          ),
        ),
      ),
    );
  }
}
