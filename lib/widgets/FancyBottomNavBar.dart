import 'package:avallis/blocs/bottom_nav_bloc.dart';
import 'package:avallis/blocs/drawer_page_bloc.dart';
import 'package:avallis/events/drawer_page_event.dart';
import 'package:avallis/states/bottom_nav_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FancyBottomNavBar extends StatelessWidget {
  final List<IconData> icons;
  // final List<String> labels;
  final List<int> indexNo;

  const FancyBottomNavBar({
    super.key,
    required this.icons,
    // required this.labels,
    required this.indexNo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Container(
          height: 55,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              return GestureDetector(
                onTap: () => context
                    .read<DrawerPageBloc>()
                    .add(PageChanged(indexNo[index])),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: state.selectedIndex == index
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icons[index],
                        color: state.selectedIndex == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        size: 28,
                      ),
                      const SizedBox(height: 4),
                      // Text('${labels[index]}'),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
