import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/widgets/Containers/custom_container.dart';
import 'package:fluency/config/router/app_router.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/constants/app_images.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomNotificationsAppBar extends StatelessWidget implements PreferredSizeWidget
{
  const CustomNotificationsAppBar({super.key,});

  @override
  Widget build(BuildContext context)
  {
    return AppBar(
      backgroundColor: AppColors.kScaffoldBGColor,
      leadingWidth: 75.w,
      centerTitle: true,
      title: Text('Notifications', style: Styles.textStyle20,),
      actions:
      [
        GestureDetector(
          onTap: ()
          {
            GoRouter.of(context).push(AppRouter.kNoNotificationsView);
          },
          child: CustomContainer(
            containerMargin: AppPadding().k24End,
            containerPadding: AppPadding().k16Horizontal6Vertical,
            containerDecoration: BoxDecoration(
                color: AppColors.kFirstGradientColor,
                borderRadius: AppBorders().radiusCircular50),
            containerChild: Text("2 New", style: Styles.textStyle10.copyWith(color: Colors.white),),
          ),
        ),
      ],
      leading: CustomContainer(
        containerChild: GestureDetector(
          onTap: ()
          {
            print('Pressed');
            GoRouter.of(context).pop();
          },
          child: Image.asset(AppIMGs().kFluencyBackArrowPNGEdit,),  //HERE
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}