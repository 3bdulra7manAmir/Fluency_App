import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget
{
  const CustomTextFormField({
    super.key,
    required this.fieldController,
    required this.fieldValidator,
    this.fieldWidth,
    this.fieldKeyboardType,
    this.fieldSuffixIcon,
    this.fieldSuffixIconColor,
    this.fieldHintText,
    this.fieldContentPadding,
    this.fieldHeight,
    required this.fieldObscureText,
  });

  final TextEditingController fieldController;
  final bool fieldObscureText;
  final String? Function(String?) fieldValidator;

  final double? fieldWidth;
  final double? fieldHeight;
  final TextInputType? fieldKeyboardType;
  final Widget? fieldSuffixIcon;
  final Color? fieldSuffixIconColor;
  final String? fieldHintText;
  final EdgeInsetsGeometry? fieldContentPadding;

  static bool hasError = false;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context)
  {
    return TextFormField(
      controller: widget.fieldController,
      obscureText: widget.fieldObscureText,
      keyboardType: widget.fieldKeyboardType ?? TextInputType.name,
      maxLines: 1,
      validator: widget.fieldValidator,
      style: TextStyle(
        fontSize: 12.sp,
        color: AppColors.kDontHaveAccountColor,
      ),
    
      decoration: InputDecoration(
        //isDense: true,
    
        filled: true,
        fillColor: AppColors.kTextFormFieldFillColor,
        hintText: widget.fieldHintText,
        hintStyle: TextStyle(fontSize: 12.sp),
        //contentPadding: widget.fieldContentPadding ?? AppPadding().kTextFieldContentPadding,
        suffixIcon: widget.fieldSuffixIcon,
        suffixIconColor: widget.fieldSuffixIconColor,
    
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.kTextFormFieldBorderSideColor),
          borderRadius: AppBorders().radiusCircular80,
        ),
    
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.kTextFormFieldBorderSideColor),
          borderRadius: AppBorders().radiusCircular80,
        ),
    
        errorText: CustomTextFormField.hasError ? "Empty Fields" : null,
        contentPadding: CustomTextFormField.hasError
            ?  EdgeInsets.symmetric(
                vertical: 20.h, horizontal: 10.w)
            :  EdgeInsets.symmetric(
                vertical: 10.h, horizontal: 10.w),
        border: OutlineInputBorder(
          borderRadius: AppBorders().radiusCircular80,
          borderSide: const BorderSide(
              color: AppColors.kTextFormFieldBorderSideColor),
        ),
    
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.kTextFormFieldBorderSideColor),
          borderRadius: AppBorders().radiusCircular80,
        ),
      ),
    
      textAlign: CustomTextFormField.hasError
          ? TextAlign.start
          : TextAlign.start,
    );
  }
}
