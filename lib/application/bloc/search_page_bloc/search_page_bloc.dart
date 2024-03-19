import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';

import '../../../infrastructure/repository/firebase_repo.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {

  SearchPageBloc() : super(SearchPageInitialState()) {
    on<SearchPageInitialEvent>((event, emit) async {
     try{ emit(SearchPageLoadingState());
      emit(SearchPageNoDataState());}
     catch(error) {
       emit(SearchPageErrorState(message: error.toString()));
     }
    });

    on<SearchPageClickedEvent>((event, emit) async {
      emit(SearchPageLoadingState());
      try {
        // Fetch filtered data based on the event parameters
        final filteredCars = await FirebaseRepo().filterUsedCars(
          brand: event.brandId ,
          type: event.typeId,
          color: event.colorId,
          range: event.rangeId,
        );
        emit(SearchPageLoadedState(filteredCars));
      } catch (error) {
        emit(SearchPageErrorState(message: error.toString()));
      }
  });

}}
