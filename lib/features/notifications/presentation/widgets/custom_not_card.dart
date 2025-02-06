import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/constants/app_responsive.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNotificationsCard extends StatelessWidget
{
  const CustomNotificationsCard({super.key, required this.title, required this.description, required this.time, required this.image,});

  final String title;
  final String description;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: KMediaQuery(context).width * 0.03,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children:
        [
          SvgPicture.asset(image),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(title, style: Styles.textStyle14.copyWith(color: AppColors.kText), overflow: TextOverflow.ellipsis,),

                const SizedBox(height: 2),

                Text(description, style: Styles.textStyle12.copyWith(fontWeight: FontWeight.normal, color: AppColors.kDontHaveAccount,),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Text(time, style: Styles.textStyle12.copyWith(color: AppColors.kDontHaveAccount),),
        ],
      ),
    );
  }
}
