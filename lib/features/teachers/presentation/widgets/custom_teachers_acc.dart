import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/utils/styles.dart';
import 'package:fluency/Core/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomFreeAccountContainer extends StatelessWidget
{
  const CustomFreeAccountContainer({super.key,});

  @override
  Widget build(BuildContext context)
  {
    return CustomContainer(
      containerPadding: AppPadding().k9Start13Top13Bottom,
      containerWidth: 128.w,
      containerHeight: 56.h,
      containerDecoration: BoxDecoration(
          gradient: const LinearGradient(colors:[AppColors.kTeachersSmallContainerFirstGradientColor, AppColors.kTeachersSmallContainerSecondGradientColor]),
          borderRadius: AppBorders().radiusCircular16,
          border: Border.all(color: AppColors.kSecondGradientColor, width: 0.5.w,)),
      containerChild: Row(
        children:
        [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text("Free Account?", style: Styles.textStyle10.copyWith(color: AppColors.kLoginFormBoxDecorationColor, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
              Text("Subscribe Now", style: Styles.textStyle12.copyWith(color: AppColors.kLoginFormBoxDecorationColor,),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          10.horizontalSpace,

          SvgPicture.asset(AppIMGs().kFluencyTeacherViewYellowArrowSVG),
        ],
      ),
    );
  }
}
