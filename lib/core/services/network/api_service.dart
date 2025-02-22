import 'package:dio/dio.dart';
import 'package:fluency/Core/services/network/dio_error.dart';
import 'package:fluency/Core/services/network/dio_init.dart';


class ApiService
{
  Future<Response?> fetchSessions() async
  {
    try
    {
      Response response = await DioClient.dio.get('sessions?filter=history');
      if (response.statusCode == 200)
      {
        return response;
      }

      else
      {
        print('Failed to fetch data: ${response.statusMessage}');
        return null;
      }
    }
    
    catch (e)
    {
      print(DioErrorHandler.handleError(e as DioException));
      return null;
    }
  }
}