// ignore_for_file: deprecated_member_use

library dio_logger;

import 'dart:developer';

import 'package:dio/dio.dart';

final dioLoggerInterceptor =
    InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
  log('[DIO] Request: ${options.method} ${options.uri}');
  log('${options.data.toString()}');
  log('Headers:');
  options.headers.forEach((key, value) {
    log('|\t$key: $value');
  });
  handler.next(options); //continue
}, onResponse: (Response response, handler) async {
  log('[DIO] Response [code ${response.statusCode}]: ${response.data.toString()}');
  handler.next(response);
  // return response; // continue
}, onError: (DioError error, handler) async {
  log('[DIO] Error: ${error.error}: ${error.response.toString()}');
  handler.next(error); //continue
});
