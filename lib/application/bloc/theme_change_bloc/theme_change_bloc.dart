import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_change_event.dart';
part 'theme_change_state.dart';

class ThemeChangeBloc extends Bloc<ThemeChangeEvent, ThemeChangeState> {
  ThemeChangeBloc() : super(ThemeChangeInitial(false)) {
    on<ThemeChangeRequestEvent>((event, emit) {
      if (state is ThemeChangeInitial) {
        final currentState = state as ThemeChangeInitial;
        final newThemeMode = !currentState.isDarkMode;
        emit(ThemeChangeInitial(newThemeMode));
      }
    });
  }
}
