import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTeachersBMS extends StatefulWidget
{
  const CustomTeachersBMS({super.key});

  @override
  State<CustomTeachersBMS> createState() => CustomTeachersBMSState();

  static void show(BuildContext context)
  {
    showModalBottomSheet(context: context, builder: (BuildContext context) => const CustomTeachersBMS(),);
  }
}

class CustomTeachersBMSState extends State<CustomTeachersBMS>
{
  @override
  Widget build(BuildContext context)
  {
    return CustomContainer(
      containerWidth: double.infinity, //375.w
      containerHeight: 556.h,
      containerDecoration: BoxDecoration(
        color: AppColors.kLoginFormBoxDecorationColor,
        borderRadius: AppBorders().verticalRadiusCircular25,
        
      ),
    );
  }
}