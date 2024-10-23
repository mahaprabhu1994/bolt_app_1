
sealed class DrawerPageEvent {}

class PageChanged extends DrawerPageEvent {
  final int index;
  PageChanged(this.index);
}