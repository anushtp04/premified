part of 'theme_change_bloc.dart';

abstract class ThemeChangeState extends Equatable {
  const ThemeChangeState();

  @override
  List<Object> get props => [];

}

final class ThemeChangeInitial extends ThemeChangeState {
  final bool isDarkMode;
  ThemeChangeInitial(this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];

}
