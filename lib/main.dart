import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(showHome: showHome),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Starter App',
          theme: themeProvider.themeData,
          home: showHome ? const LoginScreen() : const OnboardingScreen(),
          routes: {
            '/login': (context) => const LoginScreen(),
            '/home': (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
