import 'dart:convert';
import 'package:fluency/Features/teachers/data/models/teachers_info_model/teachers_info.dart';
import 'package:flutter/services.dart';


class TeachersRepositoryMock
{
  
  Future<List<TeachersinfoModel>> getTeachersList() async
  {
    final String jsonString = await rootBundle.loadString('assets/json/teachers_list_mock.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    //print("Fetched JSON: ${jsonEncode(jsonList)}");     // Debugging: Print JSON response
    return jsonList.map((json) => TeachersinfoModel.fromJson(json)).toList();
  }

  
  Future<TeachersinfoModel> getTeacherDetails(String id) async
  {
    final String jsonString = await rootBundle.loadString('assets/json/teachers_details_mock.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    //print("Fetched JSON: ${jsonEncode(jsonList)}");     // Debugging: Print JSON response
    return TeachersinfoModel.fromJson(jsonMap);
  }
}
