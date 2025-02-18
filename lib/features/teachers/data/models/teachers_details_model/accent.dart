class Accent
{
  int? id;
  String? name;

  Accent({this.id, this.name});

  factory Accent.fromJson(Map<String, dynamic> json) => Accent(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'name': name,
  };
}
