class SessionModel
{
  final String id;
  final String name;
  final String status;

  SessionModel({required this.id, required this.name, required this.status});

  factory SessionModel.fromJson(Map<String, dynamic> json)
  {
    return SessionModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      status: json['status'] ?? '',
    );
  }
}