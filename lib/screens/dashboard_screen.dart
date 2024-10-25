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

       return Padding(
         padding: const EdgeInsets.only(top: 30),
         child: Center(
           child: Column(
              children: [
                UpcomingEventWidget(),
                // const EventSliderWidget(),
                // const UpcomingEventsCard(),
              ],
            ),
         ),
       );
    }


}
