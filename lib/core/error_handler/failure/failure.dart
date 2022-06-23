abstract class Failure {
  final String message;
  Failure({
    required this.message,
  });
}

class NetworkFailure extends Failure {
  final String netWorkMessage;

  NetworkFailure({
    required this.netWorkMessage,
  }) : super(message: netWorkMessage);
}

class LocalFailure extends Failure {
  final String localMessage;

  LocalFailure({
    required this.localMessage,
  }) : super(message: localMessage);
}
