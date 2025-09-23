import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get onConnectionChange;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  // Future<bool> get isConnected => Future.value(true);

  @override
  Stream<bool> get onConnectionChange => connectionChecker.onStatusChange.map(
        (status) => status == InternetConnectionStatus.connected,
      );
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
