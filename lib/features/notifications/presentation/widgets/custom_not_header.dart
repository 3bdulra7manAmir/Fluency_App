import 'package:fluency/app/app_router.dart';
import 'package:fluency/core/utils/constants.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomNotificationsHeader extends StatelessWidget
{
  const CustomNotificationsHeader({super.key,});

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          //SvgPicture.asset(AppIMGs().kFluencyBackArrowSVG, width: 80,),
          GestureDetector(
            onTap: (){GoRouter.of(context).pop();},
            child: Image.asset(AppIMGs().kFluencyBackArrowPNG,)),
      
          const SizedBox(width: 50),
      
          Text('Notifications', style: Styles.textStyle24,),
      
          const SizedBox(width: 50),
      
          GestureDetector(
            onTap: (){GoRouter.of(context).push(AppRouter.kNoNotificationsView);},
            child: Container(
              width: KMediaQuery(context).width * 0.17,
              height: 30.h,
              decoration: BoxDecoration(color: AppColors.kFirstGradient, borderRadius: BorderRadius.circular(25.r)),
              child: Center(child: Text("2 New", style: Styles.textStyle12.copyWith(color: Colors.white)),),
            ),
          )
        ],
      ),
    );
  }
}