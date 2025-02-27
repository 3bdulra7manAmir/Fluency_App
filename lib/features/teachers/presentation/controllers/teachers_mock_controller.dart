import 'package:fluency/Core/services/database/hive_database.dart';
import 'package:fluency/Core/services/database/teachers_database/teachers_database.dart';
import 'package:fluency/Features/teachers/data/repository/teachers_handler_repo.dart';
import 'package:fluency/Features/teachers/data/models/teachers_details_model/teachers_details.dart';
import 'package:fluency/Features/teachers/data/datasources/teachers_mock_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final teachersListProvider = FutureProvider<List<TeachersDetailsModel>>((ref) async
{
  final teachersRepo = TeachersRepositoryMock();
  return teachersRepo.getTeachersList();
});




final teachersInfoDBSaverProvider = StateNotifierProvider.family<TeachersHandler, bool, TeachersInfoDB>(
  (ref, teacherInfo) => TeachersHandler(teacherInfo),
);