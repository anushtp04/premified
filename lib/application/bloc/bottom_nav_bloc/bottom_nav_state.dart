part of 'bottom_nav_bloc.dart';

abstract class BottomNavState extends Equatable {
  const BottomNavState();
}

class BottomNavInitial extends BottomNavState {
  @override
  List<Object> get props => [];
}

class BottomNavIndexChangedState extends BottomNavState {
  final int selectedIndex;

  BottomNavIndexChangedState({required this.selectedIndex});
  @override
  List<Object> get props => [selectedIndex];
}
