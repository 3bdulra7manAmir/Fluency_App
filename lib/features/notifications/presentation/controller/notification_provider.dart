import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluency/Features/notifications/data/repository/notification_repository.dart';
import 'package:fluency/Features/notifications/domain/entites/notification_entity.dart';

class NotificationController extends ChangeNotifier
{
  final NotificationRepository _notificationRepository;
  
  NotificationController(this._notificationRepository)
  {
    fetchNotifications();
  }

  List<NotificationEntity> _notifications = [];
  List<NotificationEntity> get notifications => _notifications;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchNotifications() async
  {
    _isLoading = true;
    notifyListeners();

    try
    {
      _notifications = await _notificationRepository.getNotifications();
    }
    catch (e)
    {
      debugPrint("Error fetching notifications: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}

final notificationControllerProvider = ChangeNotifierProvider((ref) => NotificationController(ref.read(notificationRepositoryProvider)),);
final notificationRepositoryProvider = Provider((ref) => NotificationRepository());