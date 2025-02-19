import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNotificationsCard extends StatelessWidget {
  const CustomNotificationsCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.image,
  });

  final String title;
  final String description;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding().k16Horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 7.h),
            child: SvgPicture.asset(
              image,
            ),
          ),

          8.horizontalSpace,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.textStyle14
                      .copyWith(color: AppColors.kDontHaveAccountColor),
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Text(
                  description,
                  style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.normal,
                    color: AppColors.kDontHaveAccountColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          Text(
            time,
            style: Styles.textStyle10
                .copyWith(color: AppColors.kDontHaveAccountColor),
          ),
        ],
      ),
    );
  }
}
