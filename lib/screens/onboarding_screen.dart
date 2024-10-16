import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to our app",
          body: "This is the first step of your journey with us.",
          image: const Center(child: Icon(Icons.waving_hand, size: 100.0)),
        ),
        PageViewModel(
          title: "Discover amazing features",
          body: "Our app offers a wide range of functionalities.",
          image: const Center(child: Icon(Icons.explore, size: 100.0)),
        ),
        PageViewModel(
          title: "Get started now",
          body: "You're all set to begin using our app!",
          image: const Center(child: Icon(Icons.start, size: 100.0)),
        ),
      ],
      onDone: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('showHome', true);
        Navigator.pushReplacementNamed(context, '/login');
      },
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Text("Next"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
