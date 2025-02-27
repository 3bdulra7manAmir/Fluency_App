import 'package:equatable/equatable.dart';
import 'package:fluency/Core/services/network/dio_init.dart';
import 'package:hive/hive.dart';

part 'teachers_database.g.dart'; // This will be auto-generated

@HiveType(typeId: 1, adapterName: "TeachersInfoDBAdapter")
class TeachersInfoDB extends Equatable
{
  @HiveField(0)
  final String teacherName;

  @HiveField(1)
  final String teacherBio;

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
   required this.teacherName,
   required this.teacherBio,
   required this.flagIMGPath,
   required this.countryText,
   required this.accentText,
   required this.videoUrl,
  });

  @override
  List<Object?> get props =>
  [
    teacherIMGPath,
    teacherName,
    teacherBio,
    flagIMGPath,
    countryText,
    accentText,
    videoUrl,
  ];

  @override
  String toString()
  {
    return 'TeacherInfo(image: $teacherIMGPath, name: $teacherName, bio: $teacherBio, flag: $flagIMGPath, country: $countryText, accent: $accentText, video: ${videoUrl ?? "None"})';
  }
  
}

