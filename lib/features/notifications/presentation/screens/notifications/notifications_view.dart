import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Features/notifications/data/repository/notification_repository.dart';
import 'package:fluency/Features/notifications/domain/entites/notification_entity.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_not_header.dart';
import 'package:flutter/material.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_listbuilder.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_not_card.dart';


class NotificationsView extends StatefulWidget
{
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView>
{
  final NotificationRepository _notificationRepository = NotificationRepository();
  List<NotificationEntity> _notifications = [];

  @override
  void initState()
  {
    super.initState();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async
  {
    final notifications = await _notificationRepository.getNotifications();
    setState(() {_notifications = notifications;});
  }

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomNotificationsAppBar(),

        backgroundColor: AppColors.kScaffoldBGColor,
        body: _notifications.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CustomListViewSeparatedBuilder(
                listItemCount: _notifications.length,
                listReturnedWidget: (context, index)
                {
                  final notification = _notifications[index];
                  return CustomNotificationsCard(
                    title: notification.title,
                    description: notification.description,
                    time: notification.time,
                    image: notification.image,
                  );
                },
                listSeparatorWidget: Padding(
                  padding: AppPadding().kListSeparatorPadding,
                  child: const Divider(),
                ),
              ),
      ),
    );
  }
}
