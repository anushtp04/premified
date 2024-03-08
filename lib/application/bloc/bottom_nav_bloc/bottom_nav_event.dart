part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();
}
class TabChangedEvent extends BottomNavEvent{
  final int selectedIndex;

  TabChangedEvent({required this.selectedIndex});
  @override
  List<Object?> get props => [selectedIndex];

}
