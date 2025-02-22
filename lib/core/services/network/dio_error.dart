import 'package:dio/dio.dart';


class DioErrorHandler
{
  static String handleError(DioException error)
  {
    if (error.response != null)
    {
      return 'Error: ${error.response?.statusCode} - ${error.response?.statusMessage}';
    }
    else if (error.type == DioExceptionType.connectionTimeout)
    {
      return 'Connection timeout, please try again.';
    }
    else if (error.type == DioExceptionType.receiveTimeout)
    {
      return 'Receive timeout, please try again.';
    }
    else
    {
      return 'Unexpected error occurred, please try again.';
    }
  }
}