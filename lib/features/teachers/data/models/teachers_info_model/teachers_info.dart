import 'teachers_accent.dart';
import 'teachers_nationality.dart';

class TeachersinfoModel
{
  TeachersinfoModel({
    this.id,
    this.teacherIMGPath,
    this.teacherName,
    this.teacherBio,
    this.teacherAccent,
    this.teacherNationality,
    this.teacherVideo,
  });

  String? id;
  String? teacherIMGPath;
  String? teacherName;
  String? teacherBio;
  TeachersAccent? teacherAccent;
  TeachersNationality? teacherNationality;
  String? teacherVideo;

  factory TeachersinfoModel.fromJson(Map<String, dynamic> fJson)
  {
    return TeachersinfoModel(
      id: fJson['id'] as String?,
      teacherIMGPath: fJson['photo'] as String?,
      teacherName: fJson['name'] as String?,
      teacherBio: fJson['headline'] as String?,
      teacherAccent: fJson['accent'] == null ? null : TeachersAccent.fromJson(fJson['accent'] as Map<String, dynamic>),
      teacherNationality: fJson['nationality'] == null ? null : TeachersNationality.fromJson(fJson['nationality'] as Map<String, dynamic>),
      teacherVideo: fJson['video'] as String?,
    );
  }

  Map<String, dynamic> toJson() =>
  {
        'id': id,
        'photo': teacherIMGPath,
        'name': teacherName,
        'headline': teacherBio,
        'accent': teacherAccent?.toJson(),
        'nationality': teacherNationality?.toJson(),
        'video': teacherVideo,
      };
}
