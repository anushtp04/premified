part of 'theme_change_bloc.dart';

abstract class ThemeChangeEvent extends Equatable {
  const ThemeChangeEvent();
  @override
  List<Object?> get props => [];

}

class ThemeChangeRequestEvent extends ThemeChangeEvent{
}
