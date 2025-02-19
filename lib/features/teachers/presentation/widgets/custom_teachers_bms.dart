import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/widgets/Containers/custom_container.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:fluency/core/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class CustomTeachersBMS extends ConsumerWidget
{
  const CustomTeachersBMS({super.key,
  required this.teacherIMGPath,
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

 

  static void show(BuildContext context, {required String teacherIMGPath, required String flagIMGPath, required teacherName, required teacherNameSubtitle,required String countryText, required String accentText}) 
  {
    showModalBottomSheet(
      isScrollControlled: true, // This allows better height control
      context: context, 
      builder: (BuildContext context) =>  CustomTeachersBMS(teacherIMGPath: teacherIMGPath,flagIMGPath: flagIMGPath, teacherName: teacherName, teacherNameSubtitle: teacherNameSubtitle, countryText: countryText, accentText: accentText,),
    );
  }


  @override
  Widget build(BuildContext context, WidgetRef ref)
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
    
          CustomContainer(
            containerAlignment: Alignment.center,
            containerWidth: 110.w,
            containerHeight: 110.h,
            containerDecoration: BoxDecoration(
              color: AppColors.kAlmostOrangeColor,
              borderRadius: AppBorders().radiusCircular99,
              image: DecorationImage(image: NetworkImage(teacherIMGPath),),
            ),
          ),
    
          8.verticalSpace,
    
          Text(teacherName, style: Styles.textStyle16,),
          4.verticalSpace,
    
          Padding(padding: AppPadding().k49Horizontal,
            child: Text(teacherNameSubtitle,
            style: Styles.textStyle12.copyWith(color: AppColors.kDontHaveAccountColor,), textAlign: TextAlign.center, 
            ),
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
                  children:
                  [
                    5.horizontalSpace,
                    Image.asset(flagIMGPath),
                    4.horizontalSpace,
                    Text("Nationality", style: Styles.textStyle10),
                    4.horizontalSpace,
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
                    Text(accentText,style: Styles.textStyle10.copyWith(color: AppColors.kAlmostGreyColor, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
    
          16.verticalSpace,
    
          CustomContainer(
            containerMargin: AppPadding().k24Horizontal,
            containerAlignment: Alignment.center,
            containerHeight: 191.h,
            containerWidth: 327.w,
            containerDecoration: BoxDecoration(
              borderRadius: AppBorders().radiusCircular16,
              color: AppColors.kTeachersVideoBGColor),
            containerChild: Stack(
              alignment: Alignment.center,
              children:
              [
                Image.network(teacherIMGPath, fit: BoxFit.cover, height: 222.h, width: 132.w,),
                SvgPicture.asset(AppIMGs().kFluencyTeachersViewPlayButtonSVG),
              ],
            ),
          ),
    
          16.verticalSpace,
    
          CustomPurpleButton(
          buttonMargin: AppPadding().k24Horizontal,
          buttonText: 'Book me',
          buttonOnPressed: (){},
          buttonHeight: 48.h,
          buttonWidth: 327.w,
          buttonTextStyle: Styles.textStyle14.copyWith(color: AppColors.kLoginFormContainerBGColor),
          buttonIconIsEnabled: true,
          buttonIconPath: AppIMGs().kFluencyTeachersViewCalenderPNG,
          ),
        ],
      ),
    );
  }
}