import 'package:bloc_and_go_router_empty_app/components/pages/list_view_page/bloc/list_view_bloc.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/list_view_page/ui/list_view_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListViewBloc()..add(ListViewInitialEvent()),
      child: ListViewPageBody(),
    );
  }
}
