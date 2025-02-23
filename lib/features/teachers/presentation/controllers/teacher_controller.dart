import 'package:fluency/Core/services/database/hive_db.dart';
import 'package:fluency/Features/teachers/data/models/teachers_data_linker.dart';
import 'package:fluency/Features/teachers/data/models/teachers_details_model/teachers_details_model.dart';
import 'package:fluency/Features/teachers/data/models/teachers_list_model/teachers_list_model.dart';
import 'package:fluency/Features/teachers/data/repository/teacher_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final teacherRepositoryProvider = Provider<TeacherRepository>((ref)
{
  return MockTeacherRepository();
});

final teachersListProvider = FutureProvider<List<TeachersListModel>>((ref) async
{
  final repository = ref.read(teacherRepositoryProvider);
  return repository.getTeachersList();
});

final teacherDetailsProvider = FutureProvider.family<TeachersDetailsModel, String>((ref, id) async
{
  final repository = ref.read(teacherRepositoryProvider);
  return repository.getTeacherDetails(id);
});

class TeacherController extends StateNotifier<bool>
{
  TeacherController(this.teacherInfo) : super(false)
  {
    loadSavedState();
  }

  final TeacherInfo teacherInfo;

  // Load initial state from HiveDB
  Future<void> loadSavedState() async
  {
    state = await HiveDB.isTeacherSaved(teacherInfo);
  }

  // Toggle save state
  Future<void> toggleSaveState() async
  {
    if (state)
    {
      await HiveDB.removeTeacher(teacherInfo);
    }

    else
    {
      await HiveDB.saveTeacher(teacherInfo);
    }
    state = !state; // Update UI state
  }
}

// Provider for each teacher's save state
final teacherSaveProvider = StateNotifierProvider.family<TeacherController, bool, TeacherInfo>(
  (ref, teacherInfo) => TeacherController(teacherInfo),
);