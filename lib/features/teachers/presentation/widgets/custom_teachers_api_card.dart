import 'package:fluency/Features/teachers/data/models/teachers_api_model.dart';
import 'package:flutter/material.dart';

class CustomTeachersAPICard extends StatelessWidget
{
  final TeachersAPIModel teachersData;

  const CustomTeachersAPICard({super.key, required this.teachersData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(teachersData.teacherImage),
        ),
        title: Text(teachersData.teacherName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("${teachersData.status} | ${teachersData.type}"),
        trailing: Text("${teachersData.startTime.day}-${teachersData.startTime.month}-${teachersData.startTime.year}"),
      ),
    );
  }
}
