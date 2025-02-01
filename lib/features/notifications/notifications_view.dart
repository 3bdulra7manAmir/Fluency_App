import 'package:fluency/core/utils/constants.dart';
import 'package:fluency/features/notifications/widgets/custom_listbuilder.dart';
import 'package:fluency/features/notifications/widgets/custom_not_card.dart';
import 'package:fluency/features/notifications/widgets/custom_not_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsView extends StatelessWidget
{
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldBG,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Padding(
            padding: EdgeInsets.only(left: KMediaQuery(context).width * 0.03, right: KMediaQuery(context).width * 0.03, top: 25.h),
            child: const CustomNotificationsHeader(),
          ),
      
          Expanded(
            child: CustomListViewSeparatedBuilder(
              listItemCount: 25,
              listReturnedWidget: CustomNotificationsCard(),
              listSeparatorWidget: Padding(
                padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                child: Divider(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

