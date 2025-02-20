import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/widgets/Containers/custom_container.dart';
import 'package:fluency/Features/teachers/presentation/controllers/video_controller.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_bnb_details.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_bnb_details2.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:fluency/core/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';


class CustomTeachersBMS extends StatelessWidget
{
  const CustomTeachersBMS( {super.key,
  required this.teacherIMGPath,
  required this.videoUrl,
  required this.flagIMGPath,
  required this.teacherName,
  required this.teacherNameSubtitle,
  required this.countryText,
  required this.accentText,});

  final String teacherIMGPath;
  final String flagIMGPath;
  final String teacherName;
  final String teacherNameSubtitle;
  final String countryText;
  final String accentText;

  final String videoUrl;

  static void show(BuildContext context, {required String teacherIMGPath, required String flagIMGPath, required teacherName, required teacherNameSubtitle,required String countryText, required String accentText, required videoUrl}) 
  {
    showModalBottomSheet(
      isScrollControlled: true, // This allows better height control
      context: context, 
      builder: (BuildContext context) =>  CustomTeachersBMS(teacherIMGPath: teacherIMGPath,flagIMGPath: flagIMGPath, teacherName: teacherName, teacherNameSubtitle: teacherNameSubtitle, countryText: countryText, accentText: accentText, videoUrl: videoUrl,),
    );
  }


  @override
  Widget build(BuildContext context)
  {
    return CustomContainer(
      containerWidth: double.infinity,
      containerHeight: 556.h,
      containerDecoration: BoxDecoration(color: AppColors.kLoginFormBoxDecorationColor, borderRadius: AppBorders().verticalRadiusCircular25,),
      containerChild: Column(
        children:
        [
          CustomContainer( //DIVIDER INSTEAD OR EQUAL TO IT
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
            teacherIMGPath: teacherIMGPath,
            accentText: accentText,
            countryText: countryText,
            flagIMGPath: flagIMGPath,
            teacherName: teacherName,
            teacherNameSubtitle: teacherNameSubtitle,
          ),
    
          16.verticalSpace,
    
          CustomTeachersBnbDetails2(
            videoUrl: videoUrl,
            teacherIMGPath: teacherIMGPath,
          ),
        ],
      ),
    );
  }
}