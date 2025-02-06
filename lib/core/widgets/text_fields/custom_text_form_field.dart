import 'package:fluency/core/constants/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget
{
  const CustomTextFormField({
  super.key,
  required this.fieldController,
  required this.fieldObscureText,
  required this.fieldValidator,
  this.fieldWidth,
  this.fieldKeyboardType,
  this.fieldSuffixIcon,
  this.fieldSuffixIconColor,
  this.fieldHintText,
  this.fieldContentPadding,
  this.fieldHeight,
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
   
  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      width: fieldWidth ?? KMediaQuery(context).width * 0.75,
      child: TextFormField(
        controller: fieldController,
        obscureText: fieldObscureText,
        keyboardType: fieldKeyboardType ?? TextInputType.name,
        maxLines: 1,
        validator: fieldValidator,
        style: TextStyle(fontSize: 12.sp, color: const Color(0xff777777),),

        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffFCFCFC),
          hintText: fieldHintText,
          contentPadding: fieldContentPadding ?? EdgeInsets.only(left: KMediaQuery(context).width * 0.05),
          suffixIcon: fieldSuffixIcon,
          suffixIconColor: fieldSuffixIconColor,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(color: Color(0xffF0F0F0)),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffF0F0F0)),
            borderRadius: BorderRadius.circular(25.r),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffF0F0F0)),
            borderRadius: BorderRadius.circular(25.r),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffF0F0F0)),
            borderRadius: BorderRadius.circular(25.r),
          ),
        ),

      ),
    );
  }
}