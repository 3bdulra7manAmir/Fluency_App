import 'dart:async';
import 'dart:convert';
import 'package:fluency/Features/notifications/domain/entites/notification_entity.dart';
import 'package:flutter/services.dart';

class NotificationRepository
{
  Future<List<NotificationEntity>> getNotifications() async
  {
    await Future.delayed(const Duration(seconds: 2));

    try {
      final String response =
          await rootBundle.loadString('assets/json/notifications_mock.json');
      print("JSON Response: $response"); // Debugging

      final List<dynamic> data = json.decode(response);
      print("Parsed JSON: $data"); // Debugging

      return data.map((json) => NotificationEntity.fromJson(json)).toList();
    } catch (e) {
      print("Error loading notifications: $e");
      return [];
    }
  }
}
