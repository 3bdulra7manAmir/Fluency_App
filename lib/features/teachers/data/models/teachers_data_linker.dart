import 'package:hive/hive.dart';

part 'teachers_data_linker.g.dart'; // This will be auto-generated

@HiveType(typeId: 1)
class TeacherInfo {
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

  TeacherInfo({
    required this.teacherIMGPath,
    required this.flagIMGPath,
    required this.teacherName,
    required this.teacherNameSubtitle,
    required this.countryText,
    required this.accentText,
    this.videoUrl,
  });

  // Allows modifying only specific fields while keeping the rest unchanged
  TeacherInfo copyWith({
    String? teacherIMGPath,
    String? flagIMGPath,
    String? teacherName,
    String? teacherNameSubtitle,
    String? countryText,
    String? accentText,
    String? videoUrl,
  }) {
    return TeacherInfo(
      teacherIMGPath: teacherIMGPath ?? this.teacherIMGPath,
      flagIMGPath: flagIMGPath ?? this.flagIMGPath,
      teacherName: teacherName ?? this.teacherName,
      teacherNameSubtitle: teacherNameSubtitle ?? this.teacherNameSubtitle,
      countryText: countryText ?? this.countryText,
      accentText: accentText ?? this.accentText,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }

  @override
  String toString()
  {
    return 'TeacherInfo(name: $teacherName, bio: $teacherNameSubtitle, country: $countryText, accent: $accentText, image: $teacherIMGPath, video: ${videoUrl ?? "None"})';
  }
}
