import 'dart:convert';

class TeachersListModel
{
  String? id;
  String? photo;
  String? name;
  String? headline;
  String? bio;
  Nationality? nationality;
  Accent? accent;

  TeachersListModel({
    this.id,
    this.photo,
    this.name,
    this.headline,
    this.bio,
    this.nationality,
    this.accent,
  });

  factory TeachersListModel.fromJson(Map<String, dynamic> json)
  {
    print("Parsing Teacher: ${jsonEncode(json)}"); // Debug JSON per teacher
    return TeachersListModel(
      id: json['id'] as String?,
      photo: json['photo'] as String?,
      name: json['name'] as String?,
      headline: json['headline'] as String?,
      bio: json['bio'] as String?,
      nationality: json['nationality'] != null
          ? Nationality.fromJson(json['nationality'])
          : null,
      accent: json['accent'] != null ? Accent.fromJson(json['accent']) : null,
    );
  }

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'photo': photo,
    'name': name,
    'headline': headline,
    'bio': bio,
    'nationality': nationality?.toJson(),
    'accent': accent?.toJson(),
  };
}

class Nationality
{
  int? id;
  String? code;
  String? name;
  String? flag;

  Nationality({this.id, this.code, this.name, this.flag});

  factory Nationality.fromJson(Map<String, dynamic> json)
  {
    print("Parsing Nationality: ${jsonEncode(json)}"); // Debug nationality data
    return Nationality(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      flag: json['flag'] as String?,
    );
  }

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'code': code,
    'name': name,
    'flag': flag,
  };
}

class Accent
{
  int? id;
  String? name;

  Accent({this.id, this.name});

  factory Accent.fromJson(Map<String, dynamic> json)
  {
    print("Parsing Accent: ${jsonEncode(json)}"); // Debug accent data
    return Accent(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'name': name,
  };
}
