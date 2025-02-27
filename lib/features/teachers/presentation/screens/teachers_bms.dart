import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/widgets/custom_container.dart';
import 'package:fluency/Core/services/database/teachers_database/teachers_database.dart';
import 'package:fluency/Features/teachers/presentation/controllers/video_controller.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_bms_details.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_bms_details2.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class CustomTeachersBMS extends StatelessWidget
{
  const CustomTeachersBMS({super.key, required this.teacherInfo});

  final TeachersInfoDB teacherInfo;

  static void show(BuildContext context, TeachersInfoDB teacherInfo)
  {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => CustomTeachersBMS(teacherInfo: teacherInfo),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return CustomContainer(
      containerWidth: double.infinity,
      containerHeight: 556.h,
      containerDecoration: BoxDecoration(
        color: AppColors.kLoginFormBoxDecorationColor,
        borderRadius: AppBorders().verticalRadiusCircular25,
      ),
      containerChild: Column(
        children: [
          CustomContainer(
            containerMargin: AppPadding().k8Top,
            containerWidth: 38.w,
            containerHeight: 5.h,
            containerDecoration: BoxDecoration(
              color: AppColors.kAlmostGrey2Color,
              borderRadius: AppBorders().radiusCircular100,
            ),
          ),

          16.verticalSpace,

          CustomTeachersBNBDetails1(
            teacherIMGPath: teacherInfo.teacherIMGPath,
            accentText: teacherInfo.accentText,
            countryText: teacherInfo.countryText,
            flagIMGPath: teacherInfo.flagIMGPath,
            teacherName: teacherInfo.teacherName,
            teacherNameSubtitle: teacherInfo.teacherBio,
          ),

          16.verticalSpace,

          CustomTeachersBnbDetails2(
            videoUrl: teacherInfo.videoUrl ?? '',
            teacherIMGPath: teacherInfo.teacherIMGPath,
          ),
        ],
      ),
    );
  }
}
