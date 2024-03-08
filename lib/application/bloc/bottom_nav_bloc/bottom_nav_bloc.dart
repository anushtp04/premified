
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial()) {
    on<TabChangedEvent>((event, emit) {
      emit(BottomNavIndexChangedState(selectedIndex: event.selectedIndex));

    });
  }
}
