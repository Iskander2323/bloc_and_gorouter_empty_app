part of 'list_view_bloc.dart';

class ListViewState extends Equatable {
  const ListViewState({this.items = const []});

  ListViewState copyWith({List<String>? items}) {
    return ListViewState(items: items ?? this.items);
  }

  final List<String> items;

  @override
  List<Object> get props => [items];
}
