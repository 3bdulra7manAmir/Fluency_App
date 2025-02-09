// ignore_for_file: use_build_context_synchronously

import 'package:fluency/config/router/app_router.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/constants/app_images.dart';
import 'package:flutter/material.dart';
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
  void didChangeDependencies()
  {
    super.didChangeDependencies();

    precacheImage(AssetImage(AppIMGs().kFluencyBooksPNG), context);
    Future.delayed(const Duration(seconds: 3), () {GoRouter.of(context).push(AppRouter.kLoginView);});
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppIMGs().kFluencyBooksPNG), fit: BoxFit.cover),
          gradient: const LinearGradient(colors: [AppColors.kFirstGradient, AppColors.kSecondGradient])
        ),
        child: Center(
          child: SvgPicture.asset(AppIMGs().kFluencyLogoSVG, fit: BoxFit.cover,)
        ),
      )
    );
  }
}