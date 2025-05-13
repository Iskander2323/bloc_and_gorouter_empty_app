import 'package:bloc_and_go_router_empty_app/components/widgets/custom_gesture_detector_main_button.dart';
import 'package:bloc_and_go_router_empty_app/components/widgets/custom_ink_well_main_button.dart';
import 'package:bloc_and_go_router_empty_app/components/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key});

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets Page')),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Main Buttons'),
              CustomGestureDetectorMainButton(
                title: 'Gesture Detector',
                onTap: () {},
              ),
              SizedBox(height: 20),
              CustomInkWellMainButton(title: 'Ink Well', onTap: () {}),
              SizedBox(height: 20),
              Text('Fields'),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: "text",
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: "password",
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
