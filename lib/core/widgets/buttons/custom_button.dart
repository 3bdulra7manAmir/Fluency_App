
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/constants/app_responsive.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPurpleButton extends StatelessWidget
{
  const CustomPurpleButton({super.key, required this.buttonWidth, this.buttonHeight, required this.buttonText, required this.buttonOnPressed,});

  final double buttonWidth;
  final String buttonText;
  final void Function() buttonOnPressed;
  final double? buttonHeight;

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: KMediaQuery(context).width * buttonWidth,
      height: 45.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.kFirstGradient, AppColors.kSecondGradient]),
        borderRadius: BorderRadius.circular(25.r)
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent,),
        onPressed: buttonOnPressed,
        child: Center(child: Text(buttonText, style: Styles.textStyle16.copyWith(color: Colors.white, fontWeight: FontWeight.bold),)),
      ),
    );
  }
}