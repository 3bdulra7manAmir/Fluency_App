import 'dart:async';
import 'dart:convert';
import 'package:fluency/Features/notifications/domain/entites/notification_entity.dart';
import 'package:flutter/services.dart';

class NotificationRepository
{
  Future<List<NotificationEntity>> getNotifications() async
  {
    await Future.delayed(const Duration(seconds: 2));

    final String response = await rootBundle.loadString('assets/json/notifications_mock.json');
    final List<dynamic> data = await json.decode(response);

    return data.map((json) => NotificationEntity.fromJson(json)).toList();
  }
}