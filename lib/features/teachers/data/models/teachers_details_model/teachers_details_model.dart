import 'accent.dart';
import 'nationality.dart';

class TeachersDetailsModel
{
  String? id;
  String? photo;
  String? name;
  Accent? accent;
  Nationality? nationality;
  String? headline;
  String? bio;
  String? video;

  TeachersDetailsModel({
    this.id,
    this.photo,
    this.name,
    this.accent,
    this.nationality,
    this.headline,
    this.bio,
    this.video,
  });

  factory TeachersDetailsModel.fromJson(Map<String, dynamic> json)
  {
    return TeachersDetailsModel(
      id: json['id'] as String?,
      photo: json['photo'] as String?,
      name: json['name'] as String?,
      accent: json['accent'] == null
          ? null
          : Accent.fromJson(json['accent'] as Map<String, dynamic>),
      nationality: json['nationality'] == null
          ? null
          : Nationality.fromJson(json['nationality'] as Map<String, dynamic>),
      headline: json['headline'] as String?,
      bio: json['bio'] as String?,
      video: json['video'] as String?,
    );
  }

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'photo': photo,
    'name': name,
    'accent': accent?.toJson(),
    'nationality': nationality?.toJson(),
    'headline': headline,
    'bio': bio,
    'video': video,
  };
}
