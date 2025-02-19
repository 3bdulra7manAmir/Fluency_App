import 'package:fluency/Features/teachers/data/repository/teacher_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluency/features/teachers/domain/entities/teacher_entity.dart';

final teacherRepositoryProvider = Provider<TeacherRepository>((ref)
{
  return MockTeacherRepository();
});

final teachersListProvider = FutureProvider<List<TeacherEntity>>((ref) async
{
  final repository = ref.read(teacherRepositoryProvider);
  return repository.getTeachersList();
});

final teacherDetailsProvider = FutureProvider.family<TeacherEntity, String>((ref, id) async
{
  final repository = ref.read(teacherRepositoryProvider);
  return repository.getTeacherDetails(id);
});