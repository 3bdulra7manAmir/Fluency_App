import 'package:fluency/Features/notifications/presentation/controller/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_not_header.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_listbuilder.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_not_card.dart';
import 'package:fluency/core/constants/app_colors.dart';

class NotificationsView extends ConsumerWidget
{
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    final notificationController = ref.watch(notificationControllerProvider);

    return SafeArea(
      child: Scaffold(
        appBar: const CustomNotificationsAppBar(),
        backgroundColor: AppColors.kScaffoldBGColor,
        body: notificationController.isLoading
            ? const Center(child: CircularProgressIndicator())
            : CustomListViewSeparatedBuilder(
                listItemCount: notificationController.notifications.length,
                listReturnedWidget: (context, index)
                {
                  final notification = notificationController.notifications[index];
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

