
import 'package:avallis/pages/onBoardingPage/onboard1.dart';
import 'package:avallis/pages/onBoardingPage/onboard2.dart';
import 'package:avallis/pages/onBoardingPage/onboard3.dart';
import 'package:avallis/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreen();
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  String buttonText = 'Skip';
  int currPageIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        PageView(
          onPageChanged: (index) {
            currPageIndex = index;
            if (index == 2) {
              //print(index);
              buttonText = 'Finish';
            } else {
              buttonText = 'Skip';
            }
            setState(() {});
          },
          controller: pageController,
          children: const [
            OnBoard1(),
            OnBoard2(),
            OnBoard3(),
          ],
        ),

            Container(

              alignment: const Alignment(0, 0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  currPageIndex == 0
                      ? const SizedBox(
                          width: 20,
                        )
                      : GestureDetector(
                          onTap: () {
                            //print('previous  clicked');
                            pageController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child:  Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                // boxShadow: [
                // BoxShadow(
                // color: Colors.grey.withOpacity(0.2),
                // spreadRadius: 5,
                // blurRadius: 7,
                // offset: Offset(0, 3), // changes position of shadow
                // ),
                // ],
                ),
                child: Text(
                'Previous',
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
                ),
                textAlign: TextAlign.center,
                ),
                        ),),
                  const SizedBox(
                    width: 20,
                  ),
                  SmoothPageIndicator(
                    count: 3,
                    controller: pageController,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  currPageIndex == 2
                      ? const SizedBox(
                          width: 20,
                        )
                      : GestureDetector(
                          onTap: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child:  Text('Next ', style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[800],
                          ),),
                        )
                ],
              ),
            ),
            Container(
              alignment: const Alignment(0, 0.85),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: const Text('Skip'),
              ),
            ),


      ]),
    );
  }
}
