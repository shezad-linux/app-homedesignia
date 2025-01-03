import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier dioConnectivityRequestRetrier;
  RetryInterceptor(this.dioConnectivityRequestRetrier);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_shouldRetry(err)) {
      dioConnectivityRequestRetrier.scheduleRequestRetry(
          err.requestOptions, handler);
    } else {
      super.onError(err, handler);
    }
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.unknown &&
        err.error != null &&
        err.error is SocketException;
  }
}

class DioConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequestRetrier({
    required this.dio,
    required this.connectivity,
  });

  Future<void> scheduleRequestRetry(
      RequestOptions requestOptions, ErrorInterceptorHandler handler) async {
    late StreamSubscription streamSubscription;

    Future.delayed(Duration(seconds: 1), () {
      streamSubscription = connectivity.onConnectivityChanged.listen(
        (connectivityResult) async {
          // We're connected either to WiFi or mobile data
          if (connectivityResult != ConnectivityResult.none) {
            streamSubscription.cancel();
          }
          handler.resolve(await dio.fetch(requestOptions));
        },
      );
    });
  }
}
