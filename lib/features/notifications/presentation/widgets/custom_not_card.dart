import 'package:fluency/core/utils/constants.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNotificationsCard extends StatelessWidget
{
  const CustomNotificationsCard({super.key});

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: KMediaQuery(context).width * 0.03, right: KMediaQuery(context).width * 0.03,),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Ensures proper alignment
          children:
          [
            SvgPicture.asset('assets/images/svg/Not_View_Cup.svg'),
        
            const SizedBox(width: 10,),
        
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text("New course arrival", style: Styles.textStyle14.copyWith(color: AppColors.kText)),
        
                const SizedBox(height: 2,),
        
                Text("Dorem ipsum dolor sit amet, consectetur\nadipiscing et velit interdum, ac aliquet odio mattis.",
                style: Styles.textStyle12.copyWith(fontWeight: FontWeight.normal, color: AppColors.kDontHaveAccount),
                ),
              ],
            ),
        
        
            Text("1h", style: Styles.textStyle12.copyWith(color: AppColors.kDontHaveAccount)),
          ],
        ),
      ),
    );
  }
}