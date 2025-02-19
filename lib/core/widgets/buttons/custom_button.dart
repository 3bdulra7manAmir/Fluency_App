import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/widgets/containers/custom_container.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPurpleButton extends StatelessWidget
{
  const CustomPurpleButton({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    required this.buttonText,
    required this.buttonOnPressed,
    this.buttonTextStyle,
    required this.buttonIconIsEnabled,
    this.buttonIconPath,
    this.buttonMargin,
  });

  final double? buttonWidth;
  final String buttonText;
  final void Function() buttonOnPressed;
  final double? buttonHeight;
  final TextStyle? buttonTextStyle;
  final bool buttonIconIsEnabled;
  final String? buttonIconPath;
  final EdgeInsets? buttonMargin;

  @override
  Widget build(BuildContext context)
  {
    return CustomContainer(
      containerMargin: buttonMargin ?? EdgeInsets.zero,
      containerWidth: buttonWidth ?? 295,
      containerHeight: buttonHeight ?? 48.h,
      containerDecoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.kFirstGradientColor, AppColors.kSecondGradientColor]),
        borderRadius: AppBorders().radiusCircular80,
      ),
      containerChild: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPurpleButtonColor,
          shadowColor: AppColors.kPurpleButtonColor,
        ),
        onPressed: buttonOnPressed,
        child: buttonIconIsEnabled && buttonIconPath != null && buttonIconPath!.isNotEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Image.asset(buttonIconPath!),

                  2.horizontalSpace,
                  
                  Text(buttonText, style: buttonTextStyle ?? Styles.textStyle16.copyWith(color: Colors.white),),
                ],
              )
            : Center(child: Text(buttonText, style: buttonTextStyle ?? Styles.textStyle16.copyWith(color: Colors.white),),),
      ),
    );
  }
}