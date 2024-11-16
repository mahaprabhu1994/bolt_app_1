// Bloc
import 'package:avallis/events/drawer_page_event.dart';
import 'package:avallis/states/drawer_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerPageBloc extends Bloc<DrawerPageEvent, DrawerPageState> {
  DrawerPageBloc() : super(DrawerPageState(1)) {
    on<PageChanged>((event, emit) {
      emit(DrawerPageState(event.index));
    });
  }
}
