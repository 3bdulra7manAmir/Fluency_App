import 'package:fluency/Core/services/network/api_service.dart';
import 'package:fluency/Features/teachers/data/models/teachers_model.dart';


class SessionRepository
{
  final ApiService apiService = ApiService();

  Future<List<SessionModel>> getSessions() async
  {
    final response = await apiService.fetchSessions();
    if (response != null && response.data != null)
    {
      return (response.data as List).map((e) => SessionModel.fromJson(e)).toList();
    }
    
    else
    {
      return [];
    }
  }
}