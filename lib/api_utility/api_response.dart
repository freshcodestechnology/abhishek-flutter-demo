import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class ApiResponse {
  bool success = false;
  String? error;
  dynamic data;

  ApiResponse(final Response? response, final DioException? exception) {
    if (exception == null) {
      if (response?.data is String) {
        try {
          data = json.encode(response!.data);
        } catch (e) {
          data = response?.data;
        }
      } else {
        data = response?.data;
      }
      success = true;
    } else {
      data = response?.data;
      success = false;
      error = getDioException(exception);
    }
  }

  static String getDioException(final DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'The connection has timed out';
      case DioExceptionType.badResponse:
        return 'Bad response';
      case DioExceptionType.cancel:
        return 'The request has cancelled';
      case DioExceptionType.unknown:
        if (e.error != null && e.error is HandshakeException) {
          return 'No internet connection';
        }
        if (e.message != null && e.message!.isNotEmpty) {
          return e.message!;
        }
      case _:
        return e.message ?? 'Something went wrong';
    }
    return 'Something went wrong';
  }
}
