import 'package:fluency/Features/notifications/data/repository/notification_repository.dart';
import 'package:fluency/Features/notifications/domain/entites/notification_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/constants/app_responsive.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_listbuilder.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_not_card.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_not_header.dart';


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
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async
  {
    final notifications = await _notificationRepository.getNotifications();
    setState(() {_notifications = notifications;});
  }

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kScaffoldBG,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Padding(
              padding: EdgeInsets.only(left: KMediaQuery(context).width * 0.03, right: KMediaQuery(context).width * 0.03, top: 25.h,),
              child: const CustomNotificationsHeader(),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: _notifications.isEmpty
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
                        padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                        child: const Divider(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}