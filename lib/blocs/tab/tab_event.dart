

// Events
abstract class TabEvent {}

class SelectTab extends TabEvent {
  final int tabIndex;

  SelectTab(this.tabIndex);
}