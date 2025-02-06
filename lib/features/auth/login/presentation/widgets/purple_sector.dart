import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/constants/app_images.dart';
import 'package:fluency/Features/auth/login/presentation/widgets/custom_clipper.dart';
import 'package:flutter/material.dart';

class FirstPurpleStack extends StatelessWidget
{
  const FirstPurpleStack({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Stack(
      children:
      [
        ClipPath(
          clipper: BottomCircularClipper(),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kSecondGradient,
              image: DecorationImage(image: AssetImage(AppIMGs().kFluencyLoginHatPNG), fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}


