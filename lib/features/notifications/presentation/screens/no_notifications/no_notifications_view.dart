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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            const CustomNotificationsAppBar(),
        
            52.verticalSpace,
        
            Center(
              child: Column(
              children:
              [
                SvgPicture.asset(AppIMGs().kFluencyNoNotificationsSVG),
                
                24.verticalSpace,
        
                Text('No Notifications', style: Styles.textStyle16,),
        
                4.verticalSpace,
                
                Text('Notification Inbox Empty', style: Styles.textStyle12.copyWith(fontWeight: FontWeight.normal),),
              ],
            ))
          ],
        ),
      ),
    );
  }
}