import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTeachersBillContainer extends StatelessWidget
{
  const CustomTeachersBillContainer({super.key});

  @override
  Widget build(BuildContext context)
  {
    return CustomContainer(
      containerAlignment: Alignment.center,
      containerChild: SvgPicture.asset(AppIMGs().kFluencyTeacherViewBillSVG),
      containerWidth: 56.w,
      containerHeight: 56.h,
      containerDecoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.kTeachersSmallContainerFirstGradientColor, AppColors.kTeachersSmallContainerSecondGradientColor]),
        borderRadius: AppBorders().radiusCircular16,
        border: Border.all(color: AppColors.kSecondGradientColor, width: 0.5.w,)
      ),
    );
  }
}