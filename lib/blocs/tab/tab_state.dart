
// States
abstract class TabState {}

class TabInitial extends TabState {
  final int selectedIndex;

  TabInitial(this.selectedIndex);
}