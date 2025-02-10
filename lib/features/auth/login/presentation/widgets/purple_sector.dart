import 'package:fluency/Core/widgets/containers/custom_container.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/constants/app_images.dart';
import 'package:fluency/Features/auth/login/presentation/widgets/custom_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurpleSector extends StatelessWidget
{
  const PurpleSector({super.key});

  @override
  Widget build(BuildContext context)
  {
    return ClipPath(
      clipper: BottomCircularClipper(),
      child: CustomContainer(
        containerHeight: ScreenUtil().screenHeight * 0.5,
        containerDecoration: BoxDecoration(
          color: AppColors.kSecondGradientColor,
          image: DecorationImage(image: AssetImage(AppIMGs().kFluencyLoginHatPNG), fit: BoxFit.cover),
        ),
      ),
    );
  }
}


// Container(
//         height: ScreenUtil().screenHeight * 0.5,
//         decoration: BoxDecoration(
//           color: AppColors.kSecondGradientColor,
//           image: DecorationImage(image: AssetImage(AppIMGs().kFluencyLoginHatPNG), fit: BoxFit.cover),
//         ),
//       ),