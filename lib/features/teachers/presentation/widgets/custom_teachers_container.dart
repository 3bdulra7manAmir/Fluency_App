import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/utils/styles.dart';
import 'package:fluency/Core/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTeachersContainer extends ConsumerWidget
{
  const CustomTeachersContainer({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    return CustomContainer(
      containerWidth: 128.w,
      containerHeight: 56.h,
      containerDecoration: BoxDecoration(
          gradient: const LinearGradient(colors: [AppColors.kTeachersSmallContainerFirstGradientColor, AppColors.kTeachersSmallContainerSecondGradientColor]),
          borderRadius: AppBorders().radiusCircular16,
          border: Border.all(color: AppColors.kSecondGradientColor, width: 0.5.w,)),
      containerChild: Row(
        children:
        [
          CustomContainer(
            containerMargin: AppPadding().k8Start,
            containerHeight: 40.h,
            containerWidth: 40.w,
            containerDecoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppIMGs().kFluencyTeacherViewTeacherPNG),),
              color: AppColors.kTeachersSmallContainerBGColor,
              borderRadius: AppBorders().radiusCircular8,
            ),
          ),
          15.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              12.verticalSpace,
              Text("Mohamed ...", style: Styles.textStyle10.copyWith(color: AppColors.kLoginFormBoxDecorationColor),
                overflow: TextOverflow.ellipsis,
              ),
              4.verticalSpace,
              Text("May 5 2024", style: Styles.textStyle8.copyWith(color: AppColors.kLoginFormBoxDecorationColor,),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ],
      ),
    );
  }
}
