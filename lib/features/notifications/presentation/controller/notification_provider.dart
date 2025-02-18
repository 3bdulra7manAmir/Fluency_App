import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluency/Features/notifications/data/repository/notification_repository.dart';
import 'package:fluency/Features/notifications/domain/entites/notification_entity.dart';

final notificationControllerProvider = ChangeNotifierProvider(
  (ref) => NotificationController(ref.read(notificationRepositoryProvider)),
);
final notificationRepositoryProvider =
    Provider((ref) => NotificationRepository());

class NotificationController extends ChangeNotifier {
  final NotificationRepository notificationRepository;

  NotificationController(this.notificationRepository) {
    fetchNotifications();
  }

  List<NotificationEntity> notifications = [];
  bool isLoading = true;

  Future<void> fetchNotifications() async {
    isLoading = true;
    notifyListeners();

    try {
      notifications = await notificationRepository.getNotifications();
    } catch (e) {
      debugPrint("Error fetching notifications: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
