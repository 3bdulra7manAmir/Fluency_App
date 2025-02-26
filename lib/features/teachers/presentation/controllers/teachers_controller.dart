import 'package:fluency/Core/services/database/hive_database.dart';
import 'package:fluency/Features/teachers/data/models/teachers_database.dart';
import 'package:fluency/Features/teachers/data/models/teachers_details_model/teachers_details.dart';
import 'package:fluency/Features/teachers/data/datasources/teachers_repo_mock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final teachersRepoMockProvider = Provider<TeacherRepository>((ref) {
  return TeachersRepositoryMock();
});

final teachersListProvider =
    FutureProvider<List<TeachersDetailsModel>>((ref) async {
  final repository = ref.read(teachersRepoMockProvider);
  return repository.getTeachersList();
});

final teacherDetailsProvider =
    FutureProvider.family<TeachersDetailsModel, String>((ref, id) async {
  final repository = ref.read(teachersRepoMockProvider);
  return repository.getTeacherDetails(id);
});

class TeachersController extends StateNotifier<bool> {
  TeachersController(this.teacherInfo) : super(false) {
    loadSavedState();
  }

  final TeachersInfoDB teacherInfo;

  Future<void> loadSavedState() async {
    state = await HiveDB().isTeacherSaved(teacherInfo);
  }

  Future<void> toggleSaveState() async {
    if (state) {
      await HiveDB().removeTeacher(teacherInfo);
    } else {
      await HiveDB().saveTeacher(teacherInfo);
    }
    state = !state;
  }
}

final teachersInfoDBSaverProvider =
    StateNotifierProvider.family<TeachersController, bool, TeachersInfoDB>(
  (ref, teacherInfo) => TeachersController(teacherInfo),
);
