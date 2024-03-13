import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:used_car_app/infrastructure/repository/firebase_repo.dart';
import '../../../domain/model/usedcar_model.dart';

part 'get_used_car_event.dart';

part 'get_used_car_state.dart';

class GetUsedCarBloc extends Bloc<GetUsedCarEvent, GetUsedCarState> {
  final FirebaseRepo usedCarRepo;

  StreamSubscription<List<UsedCarModel>>? _usedCarSubscription;

  GetUsedCarBloc(this.usedCarRepo) : super(GetUsedCarInitial()) {
    on<GetUsedCar>((event, emit) async {
      emit(GetUsedCarLoading());
      try {
        // Wait for the stream subscription to complete before proceeding
        await usedCarRepo.getUsedCars().listen(
          (usedCars) {
            emit(GetUsedCarLoaded(usedCars));
          },
        ).asFuture();
      } catch (error) {
        emit(GetUsedCarError());
      }
    });
  }

@override
Future<void> close() async {
  // Ensure that the stream subscription is canceled before closing the bloc
  await _usedCarSubscription?.cancel();
  return super.close();
}
}
