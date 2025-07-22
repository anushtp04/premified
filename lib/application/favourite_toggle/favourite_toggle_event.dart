import '../../domain/model/usedcar_model.dart';

abstract class FavouriteToggleEvent {}

class FavouriteClickedEvent extends FavouriteToggleEvent {
  final UsedCarModel carmodel;
  FavouriteClickedEvent({required this.carmodel});
}
