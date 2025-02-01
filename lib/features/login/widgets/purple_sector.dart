import 'package:fluency/core/utils/constants.dart';
import 'package:fluency/features/login/widgets/custom_clipper.dart';
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


