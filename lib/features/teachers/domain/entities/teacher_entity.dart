import 'package:equatable/equatable.dart';

class TeacherEntity extends Equatable
{
  final String id;
  final String teacherIMGPath;
  final String teacherName;
  final String teacherBio;
  final String? teacherAccent;
  final String? teacherNationality;
  final String? teacherVideo;

  const TeacherEntity({
    required this.id,
    required this.teacherIMGPath,
    required this.teacherName,
    required this.teacherBio,
    this.teacherAccent,
    this.teacherNationality,
    this.teacherVideo,
  });
  
  @override
  List<Object?> get props =>
  [
    id,
    teacherIMGPath,
    teacherName,
    teacherBio,
    teacherAccent,
    teacherNationality,
    teacherVideo,

  ];
}