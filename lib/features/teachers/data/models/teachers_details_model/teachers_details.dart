import 'teachers_accent.dart';
import 'teachers_nationality.dart';

class TeachersDetailsModel
{
  TeachersDetailsModel({
    this.id,
    this.photo,
    this.name,
    this.headline,
    this.bio,
    this.accent,
    this.nationality,
    this.video,
  });

  String? id;
  String? photo;
  String? name;
  String? headline;
  String? bio;
  TeachersAccent? accent;
  TeachersNationality? nationality;
  String? video;

  factory TeachersDetailsModel.fromJson(Map<String, dynamic> fJson)
  {
    return TeachersDetailsModel(
      id: fJson['id'] as String?,
      photo: fJson['photo'] as String?,
      name: fJson['name'] as String?,
      headline: fJson['headline'] as String?,
      bio: fJson['bio'] as String?,
      accent: fJson['accent'] == null
          ? null
          : TeachersAccent.fromJson(fJson['accent'] as Map<String, dynamic>),
      nationality: fJson['nationality'] == null
          ? null
          : TeachersNationality.fromJson(
              fJson['nationality'] as Map<String, dynamic>),
      video: fJson['video'] as String?,
    );
  }

  Map<String, dynamic> toJson() =>
  {
        'id': id,
        'photo': photo,
        'name': name,
        'headline': headline,
        'bio': bio,
        'accent': accent?.toJson(),
        'nationality': nationality?.toJson(),
        'video': video,
      };
}
