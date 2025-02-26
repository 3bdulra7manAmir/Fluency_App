import 'package:fluency/Config/router/app_router.dart';
import 'package:fluency/Config/router/app_routes.dart';
import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomTeachersBillContainer extends StatelessWidget
{
  const CustomTeachersBillContainer({super.key});

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: (){AppRouter.router.goNamed(AppRoutes.kNotificationsView);},
      child: CustomContainer(
        containerAlignment: Alignment.center,
        containerChild: SvgPicture.asset(AppIMGs().kFluencyTeacherViewBillSVG),
        containerWidth: 56.w,
        containerHeight: 56.h,
        containerDecoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              AppColors.kTeachersSmallContainerFirstGradientColor,
              AppColors.kTeachersSmallContainerSecondGradientColor
            ]),
            borderRadius: AppBorders().radiusCircular16,
            border: Border.all(
              color: AppColors.kSecondGradientColor,
              width: 0.5.w,
            )),
      ),
    );
  }
}
