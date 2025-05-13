import 'package:bloc_and_go_router_empty_app/components/bloc/app_bloc.dart';
import 'package:bloc_and_go_router_empty_app/components/ui/app_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AppBloc(), child: AppPageBody());
  }
}
