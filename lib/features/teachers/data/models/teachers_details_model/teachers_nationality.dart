class TeachersNationality
{
  TeachersNationality({this.id, this.code, this.name, this.flag});

  int? id;
  String? code;
  String? name;
  String? flag;

  factory TeachersNationality.fromJson(Map<String, dynamic> fJson) =>
      TeachersNationality(
        id: fJson['id'] as int?,
        code: fJson['code'] as String?,
        name: fJson['name'] as String?,
        flag: fJson['flag'] as String?,
      );

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'code': code,
    'name': name,
    'flag': flag,
  };
}
