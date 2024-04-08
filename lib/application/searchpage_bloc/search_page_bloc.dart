import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failures/main_failure.dart';
import '../../domain/i_firebase_repo.dart';
import '../../domain/model/usedcar_model.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';
part 'search_page_bloc.freezed.dart';

@injectable
class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  final IFirebaseRepo _firebaseRepo;
  SearchPageBloc(this._firebaseRepo) : super( SearchPageState.initial()) {
    on<Initialize>((event, emit) {
      emit(SearchPageState(isLoading: false, searchFailureOptions: None(), usedCarModel: [],isError: false));
    });
    on<SearchButtonClicked>((event, emit)async{
      emit(SearchPageState(isLoading: true, searchFailureOptions: None(), usedCarModel: [],isError: false));

      final searchCars = await _firebaseRepo.searchSingleUsedCar(name: event.name);
        emit(
            searchCars.fold((failure) => state.copyWith(
                isLoading: false,
                isError: true,
                searchFailureOptions: Some(Left(failure))
            ), (success) => state.copyWith(
                isLoading: false,
                isError: false,
                searchFailureOptions: Some(Right(success)),
                usedCarModel: success
            ))
        );
      });

    on<FilterButtonClicked>((event, emit)async{
      emit( SearchPageState(isLoading: true, usedCarModel: [], searchFailureOptions: None(), isError: false),);

      final searchCars = await _firebaseRepo.filterSearchUsedCars(color: event.colorId,brand: event.brandId,type: event.typeId,range: event.rangeId);

      emit(
          searchCars.fold((failure) => state.copyWith(
              isLoading: false,
              isError: true,
              searchFailureOptions: Some(Left(failure))
          ), (success) => state.copyWith(
              isLoading: false,
              isError: false,
              searchFailureOptions: Some(Right(success)),
              usedCarModel: success
          ))
      );
    });
  }
}
