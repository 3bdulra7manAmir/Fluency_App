import 'package:dio/dio.dart';
import 'package:fluency/Core/services/network/dio_error.dart';
import 'package:fluency/Core/services/network/dio_init.dart';

class ApiService
{
  ApiService._internal();
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  
  
  static final Dio _dio = DioClient.dio;
  Future<Response?> fetchSessions() async
  {
    try
    {
      final response = await _dio.get('sessions?filter=history');

      if (response.statusCode == 200)
      {
        return response;
      }

      else
      {
        //print('Failed to fetch sessions: ${response.statusCode} - ${response.statusMessage}');
        return null;
      }
    }

    catch (e)
    {
      //print('Dio Error: ${DioExceptions.fromDioError(e as DioException)}');
      return null;
    }
  }
}
