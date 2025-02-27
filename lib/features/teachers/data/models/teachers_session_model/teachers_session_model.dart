class TeachersAPIModel
{
  final String id;
  final String status;
  final String type;
  final String teacherName;
  final String teacherImage;
  final String teacherHeadline;
  final DateTime startTime;
  final int duration;

  TeachersAPIModel({
    required this.id,
    required this.status,
    required this.type,
    required this.teacherName,
    required this.teacherImage,
    required this.teacherHeadline,
    required this.startTime,
    required this.duration,
  });

  factory TeachersAPIModel.fromJson(Map<String, dynamic> json)
  {
    return TeachersAPIModel(
      id: json['id'],
      status: json['status']['name'],
      type: json['type']['name'],
      teacherName: json['teacher']['name'],
      teacherImage: json['teacher']['photo'],
      teacherHeadline: json['teacher']['headline'],
      startTime: DateTime.parse(json['starts_at']),
      duration: json['duration'],
    );
  }
}
