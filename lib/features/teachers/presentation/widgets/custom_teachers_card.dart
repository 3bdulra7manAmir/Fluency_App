import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/widgets/Containers/custom_container.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTeachersCard extends StatelessWidget
{
  const CustomTeachersCard({super.key,
  required this.teacherIMGPath,
  required this.teacherName,
  required this.teacherNameSubtitle,
  required this.flagIMGPath,
  required this.countryText,
  required this.accentText});

  final String teacherIMGPath;
  final String teacherName;
  final String teacherNameSubtitle;

  final String flagIMGPath;
  final String countryText;
  
  final String accentText;

  @override
  Widget build(BuildContext context)
  {
    return CustomContainer(
      containerWidth: 327.w,
      containerHeight: 258.h,
      containerDecoration: BoxDecoration(
        color: AppColors.kLoginFormBoxDecorationColor,
        borderRadius: AppBorders().radiusCircular16,
      ),
      containerChild: Column(
        children:
        [
          CustomContainer(
            containerWidth: 311.w,
            containerHeight: 149.h,
            containerMargin: AppPadding().k8Horizonta8Vertical,
            containerPadding: AppPadding().k4Start4Top8Bottom,
            containerDecoration: BoxDecoration(
              color: AppColors.kTeachersSmallContainerBGColorWithOpacity,
              borderRadius: AppBorders().radiusCircular8,
            ),
            containerChild: Row(  //OR IT COULD BE A STACK BUT STACK IS MORE LESS STABLE 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppIMGs().kFluencyTeacherViewUFOSVG),
                ),

                //Spacer(),

                //AppIMGs().kFluencyTeacherViewTeacherPNG
                Image.asset(teacherIMGPath, fit: BoxFit.cover,),

                //Spacer(),

                Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(AppIMGs().kFluencyTeacherViewTeacherSaveSVG),
                ),
              ],
            ),
          ),

          //"Mohamed Halwani"
          Text(teacherName, style: Styles.textStyle14,),
          4.verticalSpace,
          //"ESL & IELTS instructor"
          Text(teacherNameSubtitle, style: Styles.textStyle10.copyWith(fontWeight: FontWeight.w600, color: AppColors.kDontHaveAccountColor),),

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
                  children:
                  [
                    5.horizontalSpace,
                    //AppIMGs().kFluencyTeachersViewEGFlagPNG
                    Image.asset(flagIMGPath),
                    4.horizontalSpace,
                    Text("Nationality", style: Styles.textStyle10),
                    4.horizontalSpace,
                    //Egypt
                    Text(countryText, style: Styles.textStyle10.copyWith(color: AppColors.kAlmostGreyColor, fontWeight: FontWeight.w600)),
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
                  children:
                  [
                    5.horizontalSpace,
                    Image.asset(AppIMGs().kFluencyTeachersView3LinesAccentPNG),
                    4.horizontalSpace,
                    Text("Accent", style: Styles.textStyle10),
                    4.horizontalSpace,
                    //American
                    Text(accentText, style: Styles.textStyle10.copyWith(color: AppColors.kAlmostGreyColor, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}



// Row(
//               //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children:
//               [
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: SvgPicture.asset('assets/images/svg/Teacher_View_UFO.svg'),
//                 ),

//                 //Spacer(),

//                 Padding(
//                   padding: AppPadding().k62Start62End,
//                   child: Image.asset('assets/images/png/Teacher_View_Teacher.png', height: 140.h,fit: BoxFit.cover,),
//                 ),

//                 //Spacer(),

//                 Align(
//                   alignment: Alignment.topRight,
//                   child: SvgPicture.asset('assets/images/svg/Teacher_View_Save.svg'),
//                 ),
//               ],
//             ),