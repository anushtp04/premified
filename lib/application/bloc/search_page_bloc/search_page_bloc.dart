import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';

import '../../../infrastructure/repository/firebase_repo.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  final FirebaseRepo usedCarRepo;

  SearchPageBloc(this.usedCarRepo) : super(SearchPageInitialState()) {
    on<SearchPageLoadedEvent>((event, emit) async {
      emit(SearchPageLoadingState());
      try {
        // Wait for the stream subscription to complete before proceeding
        await usedCarRepo.getUsedCars().listen(
              (usedCars) {
            emit(SearchPageLoadedState(usedCars));
          },
        ).asFuture();
      } catch (error) {
        emit(SearchPageErrorState());
      }
    });

    on<SearchPageClickedEvent>((event, emit) async {
      emit(SearchPageLoadingState());
      try {
        // Fetch filtered data based on the event parameters
        final filteredCars = await usedCarRepo.filterUsedCars(
          brand: event.brandId ,
          type: event.typeId,
          color: event.colorId,
          range: event.rangeId,
        );
        emit(SearchPageLoadedState(filteredCars));
      } catch (error) {
        emit(SearchPageErrorState());
      }
  });
    on<SearchPageResetEvent>((event, emit) async {
      emit(SearchPageLoadingState());
      try {
        // Wait for the stream subscription to complete before proceeding
        await usedCarRepo.getUsedCars().listen(
              (usedCars) {
            emit(SearchPageResetState(usedCars));
          },
        ).asFuture();
      } catch (error) {
        emit(SearchPageErrorState());
      }
    });

}}
