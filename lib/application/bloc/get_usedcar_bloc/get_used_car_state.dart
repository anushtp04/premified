part of 'get_used_car_bloc.dart';

abstract class GetUsedCarState extends Equatable {
  const GetUsedCarState();
  @override
  List<Object> get props => [];

}

class GetUsedCarInitial extends GetUsedCarState {}
class GetUsedCarLoading extends GetUsedCarState {}
class GetUsedCarLoaded extends GetUsedCarState {
  final List<UsedCarModel> usedCars;

  const GetUsedCarLoaded(this.usedCars);
  @override
  List<Object> get props => [usedCars];
}
class GetUsedCarError extends GetUsedCarState {}

