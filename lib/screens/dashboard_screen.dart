import 'package:avallis/blocs/bottom_nav_bloc.dart';
import 'package:avallis/blocs/drawer_page_bloc.dart';
import 'package:avallis/states/bottom_nav_state.dart';
import 'package:avallis/states/drawer_page_state.dart';
import 'package:avallis/widgets/home/UpcomingEventsCard.dart';
import 'package:avallis/widgets/home/chartWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30),
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
