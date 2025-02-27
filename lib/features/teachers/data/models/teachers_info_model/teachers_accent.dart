class TeachersAccent
{
  TeachersAccent({this.id, required this.name});

  int? id;
  String name;

  factory TeachersAccent.fromJson(Map<String, dynamic> fJson) => TeachersAccent(
    id: fJson['id'] as int?,
    name: fJson['name'] as String,
  );

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'name': name,
  };
}
