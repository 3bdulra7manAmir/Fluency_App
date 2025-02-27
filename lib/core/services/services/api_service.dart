import 'package:dio/dio.dart';
import 'package:fluency/Core/services/network/dio_error.dart';
import 'package:fluency/Core/services/network/dio_init.dart';

class ApiService
{
  ApiService._internal();
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  Future<dynamic> fetchSessions({required String endpoint, required response2List}) async
  {
    try
    {
      final response = await DioClient.dio.get(endpoint);

      if (response.statusCode == 200)
      {
        return (response.data as List).map((json) => response2List.fromJson(json)).toList();
        //return response;
      }

      else
      {
        // print('Failed to fetch sessions: ${response.statusCode} - ${response.statusMessage}');
        return null;
      }
    }

    catch (error)
    {
      // print('Dio Error: ${DioExceptions.fromDioError(e as DioException)}');
      return DioExceptions.fromDioError(error as DioException);
    }
  }
}
