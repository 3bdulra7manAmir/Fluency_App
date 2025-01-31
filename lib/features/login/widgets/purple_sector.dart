// ignore_for_file: unused_import

import 'package:fluency/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstPurpleStack extends StatelessWidget
{
  const FirstPurpleStack({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Stack(
      children:
      [
        //Positioned or Positioned.fill
        Container(
          decoration: BoxDecoration(
            color: AppColors.kSecondGradient,
            image: DecorationImage(image: AssetImage('assets/images/png/Login_View_Bg.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r), bottomRight: Radius.circular(40.r)),
          ),
        ),
      ],
    );
  }
}