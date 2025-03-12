import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final Connectivity connectivity;
  final int maxRetries;
  final List<Duration> retryDelays;

  RetryInterceptor({
    required this.dio,
    required this.connectivity,
    this.maxRetries = 3,
    this.retryDelays = const [
      Duration(seconds: 1),
      Duration(seconds: 3),
      Duration(seconds: 5),
    ],
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      for (var attempt = 0; attempt < maxRetries; attempt++) {
        await _waitForInternet();
        try {
          print("Retrying request... Attempt ${attempt + 1}");
          final response = await dio.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          print("Retry attempt ${attempt + 1} failed");
        }
        await Future.delayed(retryDelays[attempt]);
      }
    }

    // If all retries fail, forward the error
    super.onError(err, handler);
  }

  /// Checks if the request should be retried
  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout;
  }

  /// Waits for the internet connection to be restored
  Future<void> _waitForInternet() async {
    StreamSubscription<List<ConnectivityResult>>? subscription;
    final Completer<void> completer = Completer<void>();

    subscription = connectivity.onConnectivityChanged.listen((result) {
      if (!result.contains(ConnectivityResult.none)) {
        completer.complete();
        subscription?.cancel();
      }
    });

    return completer.future;
  }
}
