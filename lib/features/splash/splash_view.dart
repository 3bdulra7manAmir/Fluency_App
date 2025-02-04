// ignore_for_file: use_build_context_synchronously

import 'package:fluency/app/app_router.dart';
import 'package:fluency/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget
{
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
{

  @override
  void initState()
  {
    super.initState();
    Future.delayed(Duration(seconds: 10), () => GoRouter.of(context).push(AppRouter.kLoginView));
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: AppColors.kFirstGradient,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppIMGs().kFluencyBooksPNG), fit: BoxFit.cover),
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