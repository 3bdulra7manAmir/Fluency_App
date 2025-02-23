import 'package:dio/dio.dart';

class DioExceptions implements Exception
{
  final String message;

  DioExceptions(this.message);

  factory DioExceptions.fromDioError(DioException error)
  {
    switch (error.type)
    {
      case DioExceptionType.connectionTimeout:
        return DioExceptions("Connection timed out. Please try again.");
      case DioExceptionType.receiveTimeout:
        return DioExceptions("Receive timeout in connection.");
      case DioExceptionType.badResponse:
        return DioExceptions("Server error: ${error.response?.statusCode}");
      case DioExceptionType.cancel:
        return DioExceptions("Request to server was cancelled.");
      default:
        return DioExceptions("Something went wrong.");
    }
  }
}
