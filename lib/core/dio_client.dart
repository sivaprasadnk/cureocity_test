import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country_app/core/constants.dart';
import 'package:country_app/core/retry_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DioClient {
  final Dio _dio;
  final Connectivity _connectivity;

  DioClient(this._dio, this._connectivity) {
    _dio
      ..options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      )
      ..interceptors.addAll([
        _connectivityInterceptor(),
        _retryInterceptor(),
        // LogInterceptor(responseBody: true), // For debugging
      ]);
  }

  /// Retry Interceptor (for automatic retries)
  RetryInterceptor _retryInterceptor() {
    return RetryInterceptor(
      connectivity: _connectivity,
      dio: _dio,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 3),
        Duration(seconds: 5),
      ],
    );
  }

  /// Interceptor to wait for internet connectivity before retrying failed requests
  InterceptorsWrapper _connectivityInterceptor() {
    return InterceptorsWrapper(
      onError: (DioException e, handler) async {
        if (_isNetworkError(e)) {
          Fluttertoast.showToast(
            msg: "No internet connection. Waiting for reconnection...",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          await _waitForInternet();
          Fluttertoast.showToast(
            msg: "Internet reconnected...",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          return handler.resolve(await _dio.fetch(e.requestOptions));
        }
        return handler.next(e);
      },
    );
  }

  /// Check if the error is due to no internet connection
  bool _isNetworkError(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout;
  }

  /// Wait until connectivity is restored
  Future<void> _waitForInternet() async {
    StreamSubscription<List<ConnectivityResult>>? subscription;
    final Completer<void> completer = Completer<void>();

    subscription = _connectivity.onConnectivityChanged.listen((result) {
      if (!result.contains(ConnectivityResult.none)) {
        completer.complete();
        subscription?.cancel();
      }
    });

    return completer.future;
  }

  /// ✅ Example GraphQL Query Request
  Future<Map<String, dynamic>?> query(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      final response = await _dio.post(
        '',
        data: {'query': query, 'variables': variables},
      );

      if (response.statusCode == 200) {
        return response
            .data['data']; // GraphQL response data comes under 'data'
      } else {
        throw Exception(
          'GraphQL query failed with status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('GraphQL Error: $e');
      return null;
    }
  }

  /// ✅ Example GraphQL Mutation Request
  Future<Map<String, dynamic>?> mutate(
    String mutation, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      final response = await _dio.post(
        '',
        data: {'query': mutation, 'variables': variables},
      );

      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception(
          'GraphQL mutation failed with status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('GraphQL Mutation Error: $e');
      return null;
    }
  }

  /// Example GET request (optional)
  Future<Response> getRequest(String endpoint) async {
    return await _dio.get(endpoint);
  }
}
