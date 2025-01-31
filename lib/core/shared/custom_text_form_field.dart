import 'package:fluency/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget
{
  const CustomTextFormField({
  super.key,
  required this.fieldController,
  this.fieldWidth,
  this.fieldKeyboardType,
  required this.fieldValidator,
  this.fieldSuffixIcon,
  this.fieldSuffixIconColor,
  required this.fieldObscureText,
  this.fieldHintText
  });

  final TextEditingController fieldController;
  final double? fieldWidth;
  final TextInputType? fieldKeyboardType;
  final String? Function(String?) fieldValidator;
  final Widget? fieldSuffixIcon;
  final Color? fieldSuffixIconColor;
  final bool fieldObscureText;
  final String? fieldHintText;
   

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      width: fieldWidth ?? KMediaQuery(context).width * 0.7,
      child: TextFormField(
        controller: fieldController,
        obscureText: fieldObscureText,
        keyboardType: fieldKeyboardType ?? TextInputType.name,
        maxLines: 1,
        validator: fieldValidator,

        decoration: InputDecoration(
          hintText: fieldHintText,
          contentPadding: EdgeInsets.only(left: KMediaQuery(context).width * 0.04),
          suffixIcon: fieldSuffixIcon,
          suffixIconColor: fieldSuffixIconColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.r),),
        ),

      ),
    );
  }
}