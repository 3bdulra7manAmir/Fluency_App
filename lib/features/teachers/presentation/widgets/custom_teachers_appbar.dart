import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/widgets/Containers/custom_container.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_acc.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_bill.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_container.dart';
import 'package:fluency/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTeachersAppBar extends StatelessWidget
{
  const CustomTeachersAppBar({super.key,});

  @override
  Widget build(BuildContext context)
  {
    return CustomContainer(
      containerAlignment: Alignment.center,
      containerHeight: 180.h,
      containerWidth: double.infinity,
      containerDecoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: AppBorders().radiusCircular20, bottomRight: AppBorders().radiusCircular20),
        gradient: const LinearGradient(colors: [AppColors.kTeachersSmallContainerFirstGradientColor, AppColors.kTeachersSmallContainerSecondGradientColor]),
      ),
    
      containerChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              const CustomTeachersContainer(),
    
              7.5.horizontalSpace,
    
              GestureDetector(
                onTap: (){},
                child: const CustomFreeAccountContainer()),
    
              7.5.horizontalSpace,
    
              GestureDetector(
                onTap: (){},
                child: const CustomTeachersBillContainer()),
            ],
          ),
    
          //BIG Column
          16.verticalSpace,
          GestureDetector(
            onTap: (){},
            child: SvgPicture.asset(AppIMGs().kFluencyTeacherViewDownWordArrowsSVG, )), //width: 10.w, height: 14.h
        ],
      ),
    );
  }
}