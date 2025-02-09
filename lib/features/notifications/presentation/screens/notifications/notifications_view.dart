import 'package:fluency/Config/router/app_router.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/utils/styles.dart';
import 'package:fluency/Features/notifications/data/repository/notification_repository.dart';
import 'package:fluency/Features/notifications/domain/entites/notification_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_listbuilder.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_not_card.dart';
import 'package:go_router/go_router.dart';


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
        appBar: AppBar(
          leadingWidth: 27.w,
          centerTitle: true,

          title: Text('Notifications', style: Styles.textStyle20,),

          actions:
          [
            GestureDetector(
              onTap: ()
              {GoRouter.of(context).push(AppRouter.kNoNotificationsView);},
              child: Container(
                margin: EdgeInsetsDirectional.only(end: 24.w),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                    color: AppColors.kFirstGradient,
                    borderRadius: BorderRadius.circular(25.r)),
                child: Text("2 New", style: Styles.textStyle12.copyWith(color: Colors.white)),
              ),
            ),
          ],

          leading: Container(
            margin: EdgeInsetsDirectional.only(start: 24.w),
            child: GestureDetector(
              onTap: (){GoRouter.of(context).pop();},
              child: Image.asset(AppIMGs().kFluencyBackArrowPNG,)
            ),
          ),
        ),

        backgroundColor: AppColors.kScaffoldBG,
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
                  padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                  child: const Divider(),
                ),
              ),
      ),
    );
  }
}
