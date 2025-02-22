import 'package:fluency/Features/teachers/data/models/teachers_data_linker.dart';
import 'package:flutter/material.dart';
import 'package:fluency/Core/widgets/Containers/custom_container.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_bms_details.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_bms_details2.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_borders.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTeachersBMS extends StatelessWidget
{
  const CustomTeachersBMS({super.key, required this.teacherInfo});

  final TeacherInfo teacherInfo;

  static void show(BuildContext context, TeacherInfo teacherInfo)
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
        children:
        [
          CustomTeachersBNBDetails1(
            teacherIMGPath: teacherInfo.teacherIMGPath,
            accentText: teacherInfo.accentText,
            countryText: teacherInfo.countryText,
            flagIMGPath: teacherInfo.flagIMGPath,
            teacherName: teacherInfo.teacherName,
            teacherNameSubtitle: teacherInfo.teacherNameSubtitle,
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
