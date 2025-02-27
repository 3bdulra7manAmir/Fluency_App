class TeacherEntity
{
  final String id;
  final String photo;
  final String name;
  final String headline;
  final String bio;
  final String? accent;
  final String? nationality;
  final String? video;

  TeacherEntity({
    required this.id,
    required this.photo,
    required this.name,
    required this.headline,
    required this.bio,
    this.accent,
    this.nationality,
    this.video,
  });
}