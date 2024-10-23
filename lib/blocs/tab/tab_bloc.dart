import 'package:bloc/bloc.dart';
import 'package:bold1/blocs/tab/tab_event.dart';
import 'package:bold1/blocs/tab/tab_state.dart';

// Bloc
class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabInitial(0)) {
    on<SelectTab>((event, emit) {
      print(event);
      emit(TabInitial(event.tabIndex));
    });
  }
}
