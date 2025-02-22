class TeacherInfo {
  final String teacherIMGPath;
  final String flagIMGPath;
  final String teacherName;
  final String teacherNameSubtitle;
  final String countryText;
  final String accentText;
  final String? videoUrl;

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
}
