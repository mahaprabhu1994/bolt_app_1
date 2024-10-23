// Bloc
import 'package:bold1/events/bottom_nav_event.dart';
import 'package:bold1/states/bottom_nav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(0)) {
    on<TabChanged>((event, emit) {
      emit(BottomNavState(event.index));
    });
  }
}