import 'package:fluency/core/utils/constants.dart';
import 'package:fluency/features/notifications/widgets/custom_not_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoNotificationsView extends StatelessWidget
{
  const NoNotificationsView({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Padding(
            padding: EdgeInsets.only(left: KMediaQuery(context).width * 0.03, right: KMediaQuery(context).width * 0.03, top: 25.h),
            child: const CustomNotificationsHeader(),
          ),

          
        ],
      ),
    );
  }
}