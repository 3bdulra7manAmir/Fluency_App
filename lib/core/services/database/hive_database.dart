import 'package:fluency/Core/services/database/teachers_database/teachers_database.dart';
import 'package:fluency/Features/teachers/data/models/teachers_details_model/teachers_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class HiveDB
{
  HiveDB._internal();
  static final HiveDB _instance = HiveDB._internal();
  factory HiveDB() => _instance;
  
  static String get getBoxName => _teachersDetailsbox;

  static const String _teachersDetailsbox = "Teachers_Details_Box";

  Future<void> saveTeacher(TeachersInfoDB teacherInfo) async
  {
    try
    {
      var box = await Hive.openBox<TeachersInfoDB>(_teachersDetailsbox);

      if (box.containsKey(teacherInfo.teacherName))
      {
        print("Teacher '${teacherInfo.teacherName}' already exists in DB.");
        return;
      }

      await box.put(teacherInfo.teacherName, teacherInfo);
      print("Teacher '${teacherInfo.teacherName}' saved successfully!");
    }

    catch (e)
    {
      print("Error saving teacher: $e");
    }
  }

  Future<void> rmTeacher(TeachersInfoDB teacherInfo) async
  {
    try
    {
      var box = await Hive.openBox<TeachersInfoDB>(_teachersDetailsbox);
      if (box.containsKey(teacherInfo.teacherName))
      {
        await box.delete(teacherInfo.teacherName);
        print("Teacher '${teacherInfo.teacherName}' removed successfully!");
      }
      else
      {
        print("Teacher '${teacherInfo.teacherName}' not found in DB.");
      }
    }

    catch (e)
    {
      print("Error removing teacher: $e");
    }
  }

  Future<void> clearDB() async
  {
    try
    {
      var box = await Hive.openBox<TeachersInfoDB>(_teachersDetailsbox);
      await box.clear();
      print("Database cleared!");
    }

    catch (e)
    {
      print("Error clearing database: $e");
    }
  }

  Future<bool> isTeacherSaved(TeachersInfoDB teacherInfo) async
  {
    try
    {
      var box = await Hive.openBox<TeachersInfoDB>(_teachersDetailsbox);
      return box.containsKey(teacherInfo.teacherName);
    }

    catch (e)
    {
      print("Error checking teacher: $e");
      return false;
    }
  }

  Future<void> printTeachersDB() async
  {
    try
    {
      var box = await Hive.openBox<TeachersInfoDB>(_teachersDetailsbox);
      print("Teachers DB:\n${box.values.toList()}");
    }

    catch (e)
    {
      print("Error printing database: $e");
    }
  }

}
