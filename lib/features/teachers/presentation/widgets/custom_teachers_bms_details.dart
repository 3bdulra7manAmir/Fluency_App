import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/widgets/custom_container.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTeachersBNBDetails1 extends StatelessWidget
{
  const CustomTeachersBNBDetails1({
    super.key,
    required this.teacherIMGPath,
    required this.flagIMGPath,
    required this.teacherName,
    required this.teacherNameSubtitle,
    required this.countryText,
    required this.accentText,
  });

  final String teacherIMGPath;
  final String flagIMGPath;
  final String teacherName;
  final String teacherNameSubtitle;
  final String countryText;
  final String accentText;

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
      [
        CustomContainer(
          containerAlignment: Alignment.center,
          containerWidth: 110.w,
          containerHeight: 110.h,
          containerDecoration: BoxDecoration(
            color: AppColors.kAlmostOrangeColor,
            borderRadius: AppBorders().radiusCircular99,
            image: DecorationImage(image: CachedNetworkImageProvider(teacherIMGPath), fit: BoxFit.cover,),
          ),
        ),

        8.verticalSpace,

        Text(teacherName, style: Styles.textStyle16),

        4.verticalSpace,

        Padding(
          padding: AppPadding().k49Horizontal,
          child: Text(teacherNameSubtitle, style: Styles.textStyle12.copyWith(color: AppColors.kDontHaveAccountColor,), textAlign: TextAlign.center,),
        ),

        16.verticalSpace,

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            CustomContainer(
              containerWidth: 120.w,
              containerHeight: 32.h,
              containerDecoration: BoxDecoration(
                color: AppColors.kAlmostWhite2Color,
                borderRadius: AppBorders().radiusCircular42,
              ),
              containerChild: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Image.asset(flagIMGPath),

                  4.horizontalSpace,

                  Text("Nationality", style: Styles.textStyle10),

                  4.horizontalSpace,

                  Text(countryText, style: Styles.textStyle10.copyWith(color: AppColors.kAlmostGreyColor, fontWeight: FontWeight.w600,),),
                ],
              ),
            ),

            12.horizontalSpace,

            CustomContainer(
              containerWidth: 117.w,
              containerHeight: 32.h,
              containerDecoration: BoxDecoration(
                color: AppColors.kAlmostWhite2Color,
                borderRadius: AppBorders().radiusCircular42,
              ),
              containerChild: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Image.asset(AppIMGs().kFluencyTeachersView3LinesAccentPNG),
                  
                  4.horizontalSpace,

                  Text("Accent", style: Styles.textStyle10),

                  4.horizontalSpace,

                  Text(accentText, style: Styles.textStyle10.copyWith(color: AppColors.kAlmostGreyColor, fontWeight: FontWeight.w600,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
