// Bloc
import 'package:bold1/events/bottom_nav_event.dart';
import 'package:bold1/events/drawer_page_event.dart';
import 'package:bold1/states/bottom_nav_state.dart';
import 'package:bold1/states/drawer_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerPageBloc extends Bloc<DrawerPageEvent, DrawerPageState> {
  DrawerPageBloc() : super(DrawerPageState(0)) {
    on<PageChanged>((event, emit) {
      emit(DrawerPageState(event.index));
    });
  }
}