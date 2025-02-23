import 'package:dio/dio.dart';
import 'package:fluency/Core/services/network/dio_error.dart';
import 'package:fluency/Features/teachers/data/models/teachers_api_model.dart';


class TeachersAPIRepository
{
  final Dio dio;

  TeachersAPIRepository(this.dio);

  Future<List<TeachersAPIModel>> fetchSessions() async
  {
    try
    {
      final response = await dio.get('sessions?filter=history');
      return (response.data as List).map((json) => TeachersAPIModel.fromJson(json)).toList();
    }
    
    catch (error)
    {
      throw DioExceptions.fromDioError(error as DioException);
    }
  }
}
