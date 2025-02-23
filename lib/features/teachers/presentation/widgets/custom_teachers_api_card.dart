import 'package:fluency/Features/teachers/data/models/teachers_api_model.dart';
import 'package:flutter/material.dart';

class CustomTeachersAPICard extends StatelessWidget
{
  final TeachersAPIModel session;

  const CustomTeachersAPICard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(session.teacherImage),
        ),
        title: Text(session.teacherName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("${session.status} | ${session.type}"),
        trailing: Text("${session.startTime.day}-${session.startTime.month}-${session.startTime.year}"),
      ),
    );
  }
}
