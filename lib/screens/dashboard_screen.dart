import 'package:bold1/blocs/bottom_nav_bloc.dart';
import 'package:bold1/blocs/drawer_page_bloc.dart';
import 'package:bold1/states/bottom_nav_state.dart';
import 'package:bold1/states/drawer_page_state.dart';
import 'package:bold1/widgets/home/UpcomingEventsCard.dart';
import 'package:bold1/widgets/home/chartWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({super.key});


  @override
  Widget build(BuildContext context) {

       return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 65),
              child:

              Column(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 336,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Hi, Salim!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w800,
                                  height: 0.06,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Container(
                                  width: 40, // Adjust size as needed
                                  height: 40,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image:
                                      AssetImage('assets/images/menu2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),

                ],
              ),
            ),


            ChartWidgetContainer(),
            // const EventSliderWidget(),
            // const UpcomingEventsCard(),
          ],
        );
    }


}
