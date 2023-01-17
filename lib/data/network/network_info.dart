import 'package:connectivity_plus/connectivity_plus.dart';

abstract class BaseNetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo implements BaseNetworkInfo {
  final Connectivity _connectivity = Connectivity();

  @override
  Future<bool> get isConnected async {
    final ConnectivityResult res = await _connectivity.checkConnectivity();

    return res == ConnectivityResult.mobile || res == ConnectivityResult.wifi;
  }
}
