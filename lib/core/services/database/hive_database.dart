import 'package:fluency/Core/services/database/teachers_database/teachers_database.dart';
import 'package:fluency/Features/teachers/data/models/teachers_details_model/teachers_details.dart';
import 'package:fluency/Features/teachers/domain/entities/teacher_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDB
{
  HiveDB._internal();
  static final HiveDB _instance = HiveDB._internal();
  factory HiveDB() => _instance;

  static const String _teachersDetailsBox = "Teachers_Details_Box";
  late Box<TeachersInfoDB> _box;

  static String get getBoxName => _teachersDetailsBox;

  Future<void> hiveInit() async
  {
    await Hive.initFlutter();
    Hive.registerAdapter(TeachersInfoDBAdapter());
    _box = await Hive.openBox<TeachersInfoDB>(_teachersDetailsBox);
  }

  Future<void> close() async => await Hive.close();

  Future<void> saveTeacher(TeachersInfoDB teacherInfo) async
  {
    try
    {
      if (_box.containsKey(teacherInfo.teacherName))
      {
        print("Teacher '${teacherInfo.teacherName}' already exists in DB.");
        return;
      }
      await _box.put(teacherInfo.teacherName, teacherInfo);
      print("Teacher '${teacherInfo.teacherName}' saved successfully!");
    }

    catch (error)
    {
      print("Error saving teacher '${teacherInfo.teacherName}': $error");
    }
  }

  Future<void> rmTeacher(TeachersInfoDB teacherInfo) async
  {
    try {
      if (_box.containsKey(teacherInfo.teacherName))
      {
        await _box.delete(teacherInfo.teacherName);
        print("Teacher '${teacherInfo.teacherName}' removed successfully!");
      }
  
      // else
      // {
      //   print("Teacher '${teacherInfo.teacherName}' not found in DB.");
      // }
    }
    catch (error)
    {
      print("Error removing teacher '${teacherInfo.teacherName}': $error");
    }
  }

  Future<void> clearDB() async
  {
    try
    {
      await _box.clear();
      print("Database cleared!");
    }
    catch (error)
    {
      print("Error clearing database: $error");
    }
  }

  Future<bool> isTeacherSaved(String teacherName) async
  {
    return _box.containsKey(teacherName);
  }

  void printTeachersDB()
  {
    print("Teachers DB:\n${_box.values.toList()}");
  }
}
