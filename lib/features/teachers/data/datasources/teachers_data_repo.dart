import 'package:fluency/Core/services/database/hive_database.dart';
import 'package:fluency/Core/services/database/teachers_database/teachers_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeachersCRUD extends StateNotifier<bool>
{

  TeachersCRUD(this.teacherInfo) : super(false)
  {
    loadSavedState();
  }

  final TeachersInfoDB teacherInfo;

  Future<void> loadSavedState() async
  {
    state = await HiveDB().isTeacherSaved(teacherInfo);
  }

  Future<void> toggleSaveState() async
  {
    if (state)
    {
      await HiveDB().rmTeacher(teacherInfo);
    }
    else
    {
      await HiveDB().saveTeacher(teacherInfo);
    }
    state = !state;
  }

}