import 'package:bloc_and_go_router_empty_app/components/widgets/buttons/custom_gesture_detector_main_button.dart';
import 'package:bloc_and_go_router_empty_app/components/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowCaseViewPage extends StatefulWidget {
  const ShowCaseViewPage({super.key});

  @override
  State<ShowCaseViewPage> createState() => _ShowCaseViewPageState();
}

class _ShowCaseViewPageState extends State<ShowCaseViewPage> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Case View Page'),
        backgroundColor: Colors.blue,
      ),
      body: ShowCaseWidget(
        builder: (context) {
          return Builder(
            builder: (context) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Showcase(
                      key: _one,
                      description: 'This is a custom gesture detector button',
                      child: ListTile(
                        title: const Text('Show Case View Example'),
                        subtitle: const Text(
                          'This is an example of a show case view page.',
                        ),
                        onTap: () {
                          // Handle tap event
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Show Case View tapped')),
                          );
                        },
                      ),
                    ),
                    Showcase(
                      key: _two,
                      description: 'This is a custom gesture detector main button',
                      child: CustomGestureDetectorMainButton(
                        title: "title",
                        onTap: () {},
                      ),
                    ),
                    Showcase(
                      key: _three,
                      description: 'This is a custom text form field',
                      child: CustomTextFormField(
                        controller: TextEditingController(),
                        hintText: "hintText",
                      ),
                    ),
                    const Text('This is the Show Case View Page'),
                    ElevatedButton(
                      onPressed: () {
                        ShowCaseWidget.of(
                          context,
                        ).startShowCase([_one, _two, _three]);
                      },
                      child: const Text('Test Show Case View'),
                    ),
                  ],
                ),
              );
            }
          );
        },
      ),
    );
  }
}
