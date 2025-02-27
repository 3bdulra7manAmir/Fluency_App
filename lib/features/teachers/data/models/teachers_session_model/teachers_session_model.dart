import 'package:equatable/equatable.dart';

class TeachersAPIModel extends Equatable
{
  final String? id;
  final String sessionStatus;
  final String sessionType;
  final String teacherName;
  final String teacherIMGPath;
  final String teacherBio;
  final DateTime sessionStartTime;
  final int sessionDuration;

  const TeachersAPIModel({
    this.id,
    required this.sessionStatus,
    required this.sessionType,
    required this.teacherName,
    required this.teacherIMGPath,
    required this.teacherBio,
    required this.sessionStartTime,
    required this.sessionDuration,
  });

  factory TeachersAPIModel.fromJson(Map<String, dynamic> json)
  {
    return TeachersAPIModel(
      id: json['id'],
      sessionStatus: json['status']['name'],
      sessionType: json['type']['name'],
      teacherName: json['teacher']['name'],
      teacherIMGPath: json['teacher']['photo'],
      teacherBio: json['teacher']['headline'],
      sessionStartTime: DateTime.parse(json['starts_at']),
      sessionDuration: json['duration'],
    );
  }
  
  @override
  List<Object?> get props =>
  [
    id,
    sessionStatus,
    sessionType,
    teacherName,
    teacherIMGPath,
    teacherName,
    teacherBio,
    sessionStartTime,
    sessionDuration,
  ];
}
