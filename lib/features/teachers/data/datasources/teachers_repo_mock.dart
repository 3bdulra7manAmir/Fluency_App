import 'dart:convert';
import 'package:fluency/Features/teachers/data/models/teachers_details_model/teachers_details.dart';
import 'package:flutter/services.dart';


abstract class TeacherRepository
{
  Future<List<TeachersDetailsModel>> getTeachersList();
  Future<TeachersDetailsModel> getTeacherDetails(String id);
}


class TeachersRepositoryMock implements TeacherRepository
{
  @override
  Future<List<TeachersDetailsModel>> getTeachersList() async
  {
    final String jsonString = await rootBundle.loadString('assets/json/teachers_list_mock.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    //print("Fetched JSON: ${jsonEncode(jsonList)}");     // Debugging: Print JSON response
    return jsonList.map((json) => TeachersDetailsModel.fromJson(json)).toList();
  }

  @override
  Future<TeachersDetailsModel> getTeacherDetails(String id) async
  {
    final String jsonString = await rootBundle.loadString('assets/json/teachers_details_mock.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    //print("Fetched JSON: ${jsonEncode(jsonList)}");     // Debugging: Print JSON response
    return TeachersDetailsModel.fromJson(jsonMap);
  }
}
