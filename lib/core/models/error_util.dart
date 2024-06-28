import 'package:dio/dio.dart';

class DioErrorUtil {
  static String handleError(dynamic error) {
    String errorDescription = '';
    if (error is DioException) {
      errorDescription = error.message ?? '';
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = 'Request to server was cancelled';
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = 'Slow Connection';
          break;
        case DioExceptionType.unknown:
          errorDescription = 'No internet connection';
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = 'Failed to receive data from server';
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = 'Failed to send data to server';
          break;
        case DioExceptionType.badCertificate:
          errorDescription = 'Server Bad Certificate';
          break;
        case DioExceptionType.badResponse:
          errorDescription = 'Bad Server Response';
          break;
        case DioExceptionType.connectionError:
          errorDescription = 'Failed to connect to server';
          break;
      }
    } else {
      errorDescription = error.toString();
    }

    return errorDescription;
  }
}
