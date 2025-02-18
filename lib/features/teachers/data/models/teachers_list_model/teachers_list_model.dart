class TeachersListModel
{
  String? id;
  String? photo;
  String? name;
  String? headline;
  String? bio;

  TeachersListModel({
    this.id,
    this.photo,
    this.name,
    this.headline,
    this.bio,
  });

  factory TeachersListModel.fromJson(Map<String, dynamic> json)
  {
    return TeachersListModel(
      id: json['id'] as String?,
      photo: json['photo'] as String?,
      name: json['name'] as String?,
      headline: json['headline'] as String?,
      bio: json['bio'] as String?,
    );
  }

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'photo': photo,
    'name': name,
    'headline': headline,
    'bio': bio,
  };
}
