import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/services/database/hive_database.dart';
import 'package:fluency/Core/widgets/custom_container.dart';
import 'package:fluency/Features/teachers/data/models/teachers_session_model/teachers_session_model.dart';
import 'package:fluency/Core/services/database/teachers_database/teachers_database.dart';
import 'package:fluency/Features/teachers/presentation/controllers/teachers_controller.dart';
import 'package:fluency/Features/teachers/presentation/screens/teachers_bms.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTeachersAPICard extends ConsumerWidget {
  const CustomTeachersAPICard({super.key, required this.teachersData});

  final TeachersAPIModel teachersData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherInfo = TeachersInfoDB(
      teacherIMGPath: teachersData.teacherImage,
      flagIMGPath: AppIMGs().kFluencyTeachersViewEGFlagPNG,
      teacherName: teachersData.teacherName,
      teacherNameSubtitle: teachersData.teacherHeadline,
      countryText: "N/A",
      accentText: "N/A",
      videoUrl: null,
    );

    return CustomContainer(
      containerMargin: AppPadding().k24Horizontal,
      containerWidth: 327.w,
      containerHeight: 265.h,
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
                    child:
                        SvgPicture.asset(AppIMGs().kFluencyTeacherViewUFOSVG),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    CustomTeachersBMS.show(context, teacherInfo);
                  },
                  child: CachedNetworkImage(
                    imageUrl: teacherInfo.teacherIMGPath,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref
                        .read(teachersInfoDBSaverProvider(teacherInfo).notifier)
                        .toggleSaveState();
                  },
                  child: Consumer(
                    builder: (context, ref, child) {
                      final isSaved =
                          ref.watch(teachersInfoDBSaverProvider(teacherInfo));
                      return Padding(
                        padding: AppPadding().k8Top,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(
                            isSaved
                                ? AppIMGs()
                                    .kFluencyTeacherViewTeacherSaveFilledSVG
                                : AppIMGs().kFluencyTeacherViewTeacherSaveSVG,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Text(teacherInfo.teacherName, style: Styles.textStyle14),
          4.verticalSpace,
          Text(teacherInfo.teacherNameSubtitle,
              style: Styles.textStyle10.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.kDontHaveAccountColor)),

          16.verticalSpace,

          // Session Info
          Text(
            "Next Session: ${teachersData.startTime.day}-${teachersData.startTime.month}-${teachersData.startTime.year} "
            "at ${teachersData.startTime.hour}:${teachersData.startTime.minute.toString().padLeft(2, '0')}",
            style: Styles.textStyle10.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.kDontHaveAccountColor),
          ),

          Text(
            "Duration: ${teachersData.duration} minutes",
            style: Styles.textStyle10.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.kDontHaveAccountColor),
          ),

          Text(
            "Session Type: ${teachersData.type}",
            style: Styles.textStyle10.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.kDontHaveAccountColor),
          ),
        ],
      ),
    );
  }
}
