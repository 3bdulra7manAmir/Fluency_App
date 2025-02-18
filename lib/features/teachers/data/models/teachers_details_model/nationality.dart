class Nationality
{
  int? id;
  String? code;
  String? name;
  String? flag;

  Nationality({this.id, this.code, this.name, this.flag});

  factory Nationality.fromJson(Map<String, dynamic> json) => Nationality(
        id: json['id'] as int?,
        code: json['code'] as String?,
        name: json['name'] as String?,
        flag: json['flag'] as String?,
      );

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'code': code,
    'name': name,
    'flag': flag,
  };
}
