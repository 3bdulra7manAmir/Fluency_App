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