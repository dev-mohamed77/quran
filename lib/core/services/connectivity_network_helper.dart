import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/subjects.dart';

class ConnectivityService {
  late final Connectivity _connectivityNetwork;

  ConnectivityService._() {
    _connectivityNetwork = Connectivity();

    _connectivityNetwork.onConnectivityChanged.listen((event) {
      connectivityStream.add(event);
    });
  }

  factory ConnectivityService() => ConnectivityService._();

  final BehaviorSubject<ConnectivityResult> connectivityStream =
      BehaviorSubject<ConnectivityResult>();
}
