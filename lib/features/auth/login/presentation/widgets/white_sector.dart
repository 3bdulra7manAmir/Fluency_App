import 'package:fluency/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SecondWhiteStack extends StatelessWidget
{
  const SecondWhiteStack({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Stack(
      children:
      [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.kAlmostWhite,
          ),
        ),
      ],
    );
  }
}