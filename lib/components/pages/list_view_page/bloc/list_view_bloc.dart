import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_view_event.dart';
part 'list_view_state.dart';

class ListViewBloc extends Bloc<ListViewEvent, ListViewState> {
  ListViewBloc() : super(ListViewState()) {
    on<ListViewInitialEvent>(_onInitialEvent);
  }

  void _onInitialEvent(
    ListViewInitialEvent event,
    Emitter<ListViewState> emit,
  ) {
    final items = List.generate(100, (index) => 'Item $index');
    emit(state.copyWith(items: items));
  }
}
