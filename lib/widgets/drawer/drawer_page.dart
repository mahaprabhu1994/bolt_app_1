import 'package:bold1/blocs/drawer_page_bloc.dart';
import 'package:bold1/events/drawer_page_event.dart';
import 'package:bold1/states/drawer_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PageNavDrawer extends StatelessWidget {
  final List<IconData> icons;
  final List<String> labels;

  const PageNavDrawer({
    super.key,
    required this.icons,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerPageBloc, DrawerPageState>(
        builder: (context, state) {
      return Container(
        height: 400,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            return GestureDetector(
              onTap: () =>
                  context.read<DrawerPageBloc>().add(PageChanged(index)),
              child: Column(

                children: [
                  Icon(
                    icons[index],
                    color: state.selectedIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    size: 28,
                  ),
                  const SizedBox(width: 4),
                  Text('${labels[index]}'),
                ],
              ),
            );
          }),
        ),

      );;
        }
    );
  }
}
