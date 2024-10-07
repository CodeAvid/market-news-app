import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkException implements Exception {
  NetworkException({required this.message});

  NetworkException.handleError(Object error) {
    if (error is DioException) {
      _handleDioError(error);
    } else {
      _handleException(error);
    }
  }

  String message = '';

  void _handleDioError(DioException dioException) {
    debugPrint(dioException.toString());
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = 'Request to server was cancelled';
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with server';
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with server';
      case DioExceptionType.badResponse:
        message = _handleResponseError(dioException.response!);
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection wth server';
      case DioExceptionType.connectionError:
        message = 'An error occurred connecting to the server';
      case DioExceptionType.badCertificate:
        message = 'Expired certificate';
      case DioExceptionType.unknown:
        message = 'Connection to server failed due no internet connection';
    }
  }

  void _handleException(dynamic exception) {
    debugPrint(exception.toString());
    if (exception is SocketException) {
      message = 'No internet connection';
    } else if (exception is String) {
      message = exception;
    } else {
      message = 'An unexpected error occurred, please try again';
    }
  }

  String _handleResponseError(Response<dynamic> response) {
    if (response.data != null) {
      final errorResponse = response.data as Map<String, dynamic>?;
      final error = errorResponse?['error'] as bool;
      return error ? (errorResponse?['message'] as String?) ?? '' : '';
    } else {
      switch (response.statusCode) {
        case 400:
          return 'Bad request';
        case 404:
          return 'The requested resource was not found';
        case 500:
          return 'Internal server error';
        default:
          return 'Something went wrong';
      }
    }
  }

  @override
  String toString() => message;
}
