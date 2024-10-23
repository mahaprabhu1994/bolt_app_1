import 'package:bold1/blocs/bottom_nav_bloc.dart';
import 'package:bold1/blocs/drawer_page_bloc.dart';
import 'package:bold1/blocs/tab/tab_bloc.dart';
import 'package:bold1/screens/client_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'blocs/theme_bloc.dart';
import 'states/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(
    MultiBlocListener(
      listeners: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<BottomNavBloc>(
          create: (context) => BottomNavBloc(),
        )
      ],
      child: MyApp(showHome: showHome),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({super.key, required this.showHome});

  @override
  Widget build(BuildContext context) {
    return
        // BlocBuilder<ThemeBloc, ThemeState>(
        //   builder: (context, themeState) {
        MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider(
          create: (_) => TabBloc(),
        ),
        BlocProvider(
          create: (_) => DrawerPageBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Flutter Starter App',
            theme: themeState.themeData,
            home: showHome ? const LoginScreen() : const OnboardingScreen(),
            routes: {
              '/login': (context) => const LoginScreen(),
              '/home': (context) => HomeScreen(),
              '/client': (context) => ClientScreen(),
            },
          );
        },
      ),
    );
  }
}
