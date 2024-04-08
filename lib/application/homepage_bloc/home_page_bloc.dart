import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';

import '../../domain/failures/main_failure.dart';
import '../../domain/i_firebase_repo.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final IFirebaseRepo _firebaseRepo;
  HomePageBloc(this._firebaseRepo) : super( HomePageState.initial()) {
    on<GetUsedCars>((event, emit)async {
      emit(HomePageState(isLoading: true, homePageFailureOptions: None(),usedCarModel: []));

      final Either<MainFailure, List<UsedCarModel>> downloadOption = await _firebaseRepo.getUsedCars();
      emit(
        downloadOption.fold(
              (failure) => state.copyWith(
              isLoading: false,
              usedCarModel: [],
              homePageFailureOptions:  Some(
                  Left(failure),
              )

          ),
              (success) => state.copyWith(
              isLoading: false,
              homePageFailureOptions: Some(Right(success)),
              usedCarModel: success,
          ),
        ),
      );
       

    });
  }
}
