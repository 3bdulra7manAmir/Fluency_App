import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/services/database/hive_database.dart';
import 'package:fluency/Core/widgets/custom_container.dart';
import 'package:fluency/Core/services/database/teachers_database/teachers_database.dart';
import 'package:fluency/Features/teachers/presentation/controllers/teachers_mock_controller.dart';
import 'package:fluency/Features/teachers/presentation/screens/teachers_bms.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTeachersMockCard extends ConsumerWidget
{
  const CustomTeachersMockCard({super.key, required this.teachersInfo});

  final TeachersInfoDB teachersInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    final isSaved = ref.watch(teachersInfoDBSaverProvider(teachersInfo));
    return CustomContainer(
      containerMargin: AppPadding().k24Horizontal,
      containerWidth: 327.w,
      containerHeight: 258.h,
      containerDecoration: BoxDecoration(
        color: AppColors.kLoginFormBoxDecorationColor,
        borderRadius: AppBorders().radiusCircular16,
      ),
      containerChild: Column(
        children: [
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
              children: [
                Padding(
                  padding: AppPadding().k8Top,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppIMGs().kFluencyTeacherViewUFOSVG,),
                  ),
                ),

                GestureDetector(
                  onTap: ()
                  {

    // Ensure `videoUrl` is properly formatted and included
    final updatedTeacherInfo = TeachersInfoDB(
      teacherName: teachersInfo.teacherName,
      teacherIMGPath: teachersInfo.teacherIMGPath,
      flagIMGPath: teachersInfo.flagIMGPath,
      teacherBio: teachersInfo.teacherBio,
      countryText: teachersInfo.countryText,
      accentText: teachersInfo.accentText,
      videoUrl: teachersInfo.videoUrl != null
          ? "https://api.fluency.live/${teachersInfo.videoUrl}"
          : null, // Ensure null safety
    );
                    CustomTeachersBMS.show(context, updatedTeacherInfo);
                  },
                  child: CachedNetworkImage(imageUrl: teachersInfo.teacherIMGPath!, fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),

                GestureDetector(
                  onTap: () {ref.read(teachersInfoDBSaverProvider(teachersInfo).notifier).toggleSaveState();},
                  child: Padding(
                    padding: AppPadding().k8Top,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(isSaved ? AppIMGs().kFluencyTeacherViewTeacherSaveFilledSVG : AppIMGs().kFluencyTeacherViewTeacherSaveSVG,),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Text(teachersInfo.teacherName!, style: Styles.textStyle14,),

          4.verticalSpace,

          Text(teachersInfo.teacherBio!, style: Styles.textStyle10.copyWith(fontWeight: FontWeight.w600, color: AppColors.kDontHaveAccountColor),),

          16.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              CustomContainer(
                containerWidth: 120.w,
                containerHeight: 32.h,
                containerDecoration: BoxDecoration(color: AppColors.kAlmostWhite2Color, borderRadius: AppBorders().radiusCircular42,),
                containerChild: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Image.asset(teachersInfo.flagIMGPath!),

                    4.horizontalSpace,

                    Text("Nationality", style: Styles.textStyle10),

                    4.horizontalSpace,

                    Text(teachersInfo.countryText!, style: Styles.textStyle10.copyWith(color: AppColors.kAlmostGreyColor, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
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

                    Text(teachersInfo.accentText!, style: Styles.textStyle10.copyWith(color: AppColors.kAlmostGreyColor, fontWeight: FontWeight.w600)),
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
