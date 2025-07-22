enum MainFailureType { clientFailure, serverFailure }

class MainFailure {
  final MainFailureType type;
  MainFailure(this.type);

  factory MainFailure.clientFailure() => MainFailure(MainFailureType.clientFailure);
  factory MainFailure.serverFailure() => MainFailure(MainFailureType.serverFailure);
}
