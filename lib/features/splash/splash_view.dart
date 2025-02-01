import 'package:fluency/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget
{
  const SplashView({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      //backgroundColor: Colors.blueGrey,
      //backgroundColor: Color(0xff905EB6),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppIMGs().kFluencyBooksPNG)),
          borderRadius: BorderRadius.circular(32.r),
          gradient: LinearGradient(colors: [AppColors.kFirstGradient, AppColors.kSecondGradient])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            
            SvgPicture.asset(AppIMGs().kFluencyLogoSVG, fit: BoxFit.cover,),
          ],
        ),
      )
    );
  }
}