import 'package:fluency/Core/services/network/dio_init.dart';
import 'package:fluency/Features/teachers/data/models/teachers_session_model/teachers_session_model.dart';
import 'package:fluency/Features/teachers/domain/repository/teachers_session_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final teachersSessionProvider = FutureProvider<List<TeachersAPIModel>>((ref) async
{
  return TeachersAPIRepository().fetchSession();
});
