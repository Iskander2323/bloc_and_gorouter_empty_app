import 'package:bloc_and_go_router_empty_app/components/pages/list_view_page/bloc/list_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewPageBody extends StatefulWidget {
  const ListViewPageBody({super.key});

  @override
  State<ListViewPageBody> createState() => _ListViewPageBodyState();
}

class _ListViewPageBodyState extends State<ListViewPageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List View Page')),
      body: BlocBuilder<ListViewBloc, ListViewState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item ${state.items[index]}'),
                subtitle: Text('Subtitle $index'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Handle delete action
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
