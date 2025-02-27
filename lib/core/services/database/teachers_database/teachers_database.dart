import 'package:equatable/equatable.dart';
import 'package:fluency/Core/services/network/dio_init.dart';
import 'package:hive/hive.dart';

part 'teachers_database.g.dart'; // This will be auto-generated

@HiveType(typeId: 1)
class TeachersInfoDB extends Equatable
{
  @HiveField(0)
  final String teacherName;

  @HiveField(1)
  final String teacherNameSubtitle;

  @HiveField(2)
  final String teacherIMGPath;

  @HiveField(3)
  final String flagIMGPath;

  @HiveField(4)
  final String countryText;

  @HiveField(5)
  final String accentText;

  @HiveField(6)
  final String? videoUrl; // Nullable video URL

  const TeachersInfoDB({
    required this.teacherIMGPath,
    required this.flagIMGPath,
    required this.teacherName,
    required this.teacherNameSubtitle,
    required this.countryText,
    required this.accentText,
    this.videoUrl,
  });

  @override
  List<Object?> get props =>
  [
    teacherName,
    teacherNameSubtitle,
    teacherIMGPath,
    flagIMGPath,
    countryText,
    accentText,
    videoUrl,
  ];

  @override
  String toString()
  {
    return 'TeacherInfo(name: $teacherName, bio: $teacherNameSubtitle, country: $countryText, accent: $accentText, image: $teacherIMGPath, video: ${videoUrl ?? "None"})';
  }
  
}

