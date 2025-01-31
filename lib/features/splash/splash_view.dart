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
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.blueGrey,
        //backgroundColor: Color(0xff905EB6),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssetsPaths().kFluencyBooks)),
            borderRadius: BorderRadius.circular(32.r),
            gradient: LinearGradient(colors: [AppColors.kFirstGradient, AppColors.kSecondGradient])
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              SvgPicture.asset(AppAssetsPaths().kFluencyLogo, fit: BoxFit.cover,),
            ],
          ),
        )
      ),
    );
  }
}