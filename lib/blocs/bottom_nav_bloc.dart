// Bloc
import 'package:avallis/events/bottom_nav_event.dart';
import 'package:avallis/states/bottom_nav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(0)) {
    on<TabChanged>((event, emit) {
      emit(BottomNavState(event.index));
    });
  }
}