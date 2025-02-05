import 'package:fluency/core/utils/constants.dart';
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
          decoration: BoxDecoration(
            color: AppColors.kAlmostWhite,
          ),
        ),
      ],
    );
  }
}