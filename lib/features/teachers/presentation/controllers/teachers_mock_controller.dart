import 'package:fluency/Core/services/database/hive_database.dart';
import 'package:fluency/Core/services/database/teachers_database/teachers_database.dart';
import 'package:fluency/Features/teachers/data/repository/teachers_handler_repo.dart';
import 'package:fluency/Features/teachers/data/models/teachers_info_model/teachers_info.dart';
import 'package:fluency/Features/teachers/data/datasources/teachers_mock_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final teachersListProvider = FutureProvider<List<TeachersinfoModel>>((ref) async
{
  final teachersRepo = TeachersRepositoryMock();
  return teachersRepo.getTeachersList();
});




final teachersInfoDBSaverProvider = StateNotifierProvider.family<TeachersHandler, bool, TeachersInfoDB>(
  (ref, teacherInfo) => TeachersHandler(teacherInfo),
);