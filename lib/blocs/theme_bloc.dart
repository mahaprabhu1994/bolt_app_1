import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/theme_event.dart';
import '../states/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: _getLightTheme())) {
    on<ToggleTheme>((event, emit) {
      emit(ThemeState(
        themeData: state.themeData.brightness == Brightness.light
            ? _getDarkTheme()
            : _getLightTheme(),
      ));
    });
  }

  static ThemeData _getLightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: const Color(0xFF009877),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF009877),
        secondary: Color(0xFF009877),
      ),
    );
  }

  static ThemeData _getDarkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: const Color(0xFF009877),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF009877),
        secondary: Color(0xFF009877),
      ),
    );
  }
}
