import 'package:dio/dio.dart';
import 'package:fluency/Core/services/network/dio_error.dart';
import 'package:fluency/Core/services/network/dio_init.dart';
import 'package:fluency/Features/teachers/data/models/teachers_session_model/teachers_session_model.dart';

class TeachersAPIRepository
{

  TeachersAPIRepository();

  Future<List<TeachersAPIModel>> fetchSession() async
  {
    try
    {
      final response = await DioClient.dio.get('sessions?filter=history');
      return (response.data as List).map((json) => TeachersAPIModel.fromJson(json)).toList();
    }
    
    catch (error)
    {
      throw DioExceptions.fromDioError(error as DioException);
    }
  }
}
