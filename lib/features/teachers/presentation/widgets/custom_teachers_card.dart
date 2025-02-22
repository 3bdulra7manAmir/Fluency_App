import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/services/database/hive_db.dart';
import 'package:fluency/Core/widgets/Containers/custom_container.dart';
import 'package:fluency/Features/teachers/data/models/teachers_data_linker.dart';
import 'package:fluency/Features/teachers/presentation/controllers/teacher_controller.dart';
import 'package:fluency/Features/teachers/presentation/screens/teachers_bms.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTeachersCard extends ConsumerWidget
{
  const CustomTeachersCard({super.key, required this.teacherInfo});

  final TeacherInfo teacherInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    return CustomContainer(
      containerMargin: AppPadding().k24Horizontal,
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
            containerChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                Padding(
                  padding: AppPadding().k8Top,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppIMGs().kFluencyTeacherViewUFOSVG, ),
                  ),
                ),

                GestureDetector(
                  onTap: () async
                  {
                    final teacherDetails = await ref.read(teacherRepositoryProvider).getTeacherDetails(teacherInfo.teacherName);
                    CustomTeachersBMS.show(context, teacherInfo.copyWith(videoUrl: teacherDetails.video != null ? "https://api.fluency.live/${teacherDetails.video}" : null,),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: teacherInfo.teacherIMGPath,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),

                GestureDetector(
                  onTap: () async
                  {
                      await HiveDB.saveTeacher(teacherInfo);
                      await HiveDB.printTeachersDB();
                  },
                  child: Padding(
                    padding: AppPadding().k8Top,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(AppIMGs().kFluencyTeacherViewTeacherSaveSVG),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Text(teacherInfo.teacherName, style: Styles.textStyle14,),
          
          4.verticalSpace,

          Text(teacherInfo.teacherNameSubtitle, style: Styles.textStyle10.copyWith(fontWeight: FontWeight.w600, color: AppColors.kDontHaveAccountColor),),

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
                    Image.asset(teacherInfo.flagIMGPath),

                    4.horizontalSpace,
                    
                    Text("Nationality", style: Styles.textStyle10),

                    4.horizontalSpace,

                    Text(teacherInfo.countryText, style: Styles.textStyle10.copyWith(color: AppColors.kAlmostGreyColor, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
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
                    //American
                    Text(teacherInfo.accentText, style: Styles.textStyle10.copyWith(color: AppColors.kAlmostGreyColor, fontWeight: FontWeight.w600)),
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