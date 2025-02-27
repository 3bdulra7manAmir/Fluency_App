import 'package:dio/dio.dart';
import 'package:fluency/Core/services/network/dio_error.dart';
import 'package:fluency/Core/services/network/dio_init.dart';
import 'package:fluency/Core/services/services/api_service.dart';
import 'package:fluency/Core/services/services/api_strings.dart';
import 'package:fluency/Features/teachers/data/models/teachers_session_model/teachers_session_model.dart';

class TeachersAPIRepository
{
  Future<List<TeachersAPIModel>> fetchSession() async
  {
    try
    {
      return await ApiService().fetchSessions(endpoint: ApiStrings.history, response2List: TeachersAPIModel);
    }
    
    catch (error)
    {
      throw DioExceptions.fromDioError(error as DioException);
    }
  }
}
