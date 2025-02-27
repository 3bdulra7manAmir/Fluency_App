import 'package:fluency/Core/services/database/hive_database.dart';
import 'package:fluency/Core/services/database/teachers_database/teachers_database.dart';
import 'package:fluency/Features/teachers/data/models/teachers_details_model/teachers_details.dart';
import 'package:fluency/Features/teachers/data/datasources/teachers_repo_mock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final teachersListProvider = FutureProvider<List<TeachersDetailsModel>>((ref) async
{
  final teachersRepo = TeachersRepositoryMock();
  return teachersRepo.getTeachersList();
});


class TeachersController extends StateNotifier<bool>
{

  TeachersController(this.teacherInfo) : super(false)
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

final teachersInfoDBSaverProvider = StateNotifierProvider.family<TeachersController, bool, TeachersInfoDB>(
  (ref, teacherInfo) => TeachersController(teacherInfo),
);