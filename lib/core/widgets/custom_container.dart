import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.containerHeight,
      this.containerWidth,
      this.containerDecoration,
      this.containerDecorationColor,
      this.containerChild,
      this.containerDecorationImage,
      this.containerMargin,
      this.containerPadding,
      this.containerGradient,
      this.clipBehavior,
      this.containerAlignment});

  final double? containerHeight;
  final double? containerWidth;
  final Decoration? containerDecoration;
  final Color? containerDecorationColor;
  final Widget? containerChild;
  final DecorationImage? containerDecorationImage;
  final EdgeInsetsGeometry? containerMargin;
  final EdgeInsetsGeometry? containerPadding;
  final Gradient? containerGradient;
  final Clip? clipBehavior;
  final AlignmentGeometry? containerAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: clipBehavior ?? Clip.none,
      height: containerHeight,
      width: containerWidth,
      margin: containerMargin ?? EdgeInsets.zero,
      padding: containerPadding ?? EdgeInsets.zero,
      alignment: containerAlignment,
      decoration: containerDecoration ??
          (containerDecorationColor != null || containerGradient != null
              ? BoxDecoration(
                  color: containerDecorationColor,
                  gradient: containerGradient,
                  image: containerDecorationImage,
                )
              : null),
      child: containerChild ?? const SizedBox.shrink(),
    );
  }
}
