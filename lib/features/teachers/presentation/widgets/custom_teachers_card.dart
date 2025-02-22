import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Features/teachers/data/models/teachers_data_linker.dart';
import 'package:flutter/material.dart';
import 'package:fluency/Core/widgets/Containers/custom_container.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomTeachersCard extends StatelessWidget
{
  const CustomTeachersCard({super.key, required this.teacherInfo});

  final TeacherInfo teacherInfo;

  @override
  Widget build(BuildContext context)
  {
    return CustomContainer(
      containerMargin: EdgeInsets.symmetric(horizontal: 24.w),
      containerWidth: 327.w,
      containerHeight: 258.h,
      containerDecoration: BoxDecoration(color: AppColors.kLoginFormBoxDecorationColor,
        borderRadius: AppBorders().radiusCircular16,
      ),
      containerChild: Column(
        children:
        [
          CachedNetworkImage(imageUrl: teacherInfo.teacherIMGPath, fit: BoxFit.cover),

          8.verticalSpace,

          Text(teacherInfo.teacherName, style: Styles.textStyle14),

          4.verticalSpace,

          Text(teacherInfo.teacherNameSubtitle,style: Styles.textStyle10.copyWith(fontWeight: FontWeight.w600, color: AppColors.kAlmostGreyColor,),),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoBox("Nationality", teacherInfo.flagIMGPath, teacherInfo.countryText),
              12.horizontalSpace,
              _buildInfoBox("Accent", "assets/accent_icon.png", teacherInfo.accentText),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String label, String imagePath, String value) {
    return CustomContainer(
      containerWidth: 120.w,
      containerHeight: 32.h,
      containerDecoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(42),
      ),
      containerChild: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          4.horizontalSpace,
          Text(label, style: Styles.textStyle10),
          4.horizontalSpace,
          Text(
            value,
            style: Styles.textStyle10.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
