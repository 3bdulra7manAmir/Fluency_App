import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:fluency/Features/notifications/presentation/widgets/custom_not_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoNotificationsView extends StatelessWidget
{
  const NoNotificationsView({super.key});

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kScaffoldBGColor,
        body: Padding(
          padding: EdgeInsets.only(left: 0 * 0.03, right: 0 * 0.03, top: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              const CustomNotificationsAppBar(),

              const SizedBox(height: 60,),

              Center(
                child: Column(
                children:
                [
                  SvgPicture.asset(AppIMGs().kFluencyNoNotificationsSVG),
                  
                  const SizedBox(height: 30,),

                  Text('No Notifications', style: Styles.textStyle16,),

                  const SizedBox(height: 5,),
                  
                  Text('Notification Inbox Empty', style: Styles.textStyle12.copyWith(fontWeight: FontWeight.normal),),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}