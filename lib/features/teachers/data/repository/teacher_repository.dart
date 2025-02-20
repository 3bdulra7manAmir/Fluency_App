import 'dart:convert';
import 'package:fluency/Features/teachers/data/models/teachers_details_model/teachers_details_model.dart';
import 'package:fluency/Features/teachers/data/models/teachers_list_model/teachers_list_model.dart';
import 'package:flutter/services.dart' show rootBundle;


abstract class TeacherRepository
{
  Future<List<TeachersListModel>> getTeachersList();
  Future<TeachersDetailsModel> getTeacherDetails(String id);
}

class MockTeacherRepository implements TeacherRepository
{
  @override
  Future<List<TeachersListModel>> getTeachersList() async
  {
    final String jsonString = await rootBundle.loadString('assets/json/teachers_list_mock.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    //print("Fetched JSON: ${jsonEncode(jsonList)}");     // Debugging: Print JSON response
    return jsonList.map((json) => TeachersListModel.fromJson(json)).toList();
  }

  @override
  Future<TeachersDetailsModel> getTeacherDetails(String id) async
  {
    final String jsonString = await rootBundle.loadString('assets/json/teachers_details_mock.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return TeachersDetailsModel.fromJson(jsonMap);
  }
}