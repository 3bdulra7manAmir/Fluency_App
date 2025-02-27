import 'package:fluency/Core/services/network/dio_init.dart';
import 'package:fluency/Features/teachers/data/models/teachers_session_model/teachers_session_model.dart';
import 'package:fluency/Features/teachers/domain/repository/teachers_api_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final teachersRepositoryProvider = Provider<TeachersAPIRepository>((ref) {
  return TeachersAPIRepository();
});

final teachersProvider = FutureProvider<List<TeachersAPIModel>>((ref) async
{
  return ref.read(teachersRepositoryProvider).fetchSession();
});
