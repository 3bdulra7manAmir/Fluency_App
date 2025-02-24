import 'package:fluency/Core/widgets/containers/custom_container.dart';
import 'package:fluency/config/router/app_router.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
{
  bool isNavigating = false;

  @override
  void didChangeDependencies()
  {
    super.didChangeDependencies();

    precacheImage(AssetImage(AppIMGs().kFluencyBooksPNG), context);

    if (!isNavigating)
    {
      isNavigating = true;
      Future.delayed(const Duration(seconds: 3), () 
      {
        AppRouter.router.pushReplacementNamed(AppRouter.kLoginView);
      });
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: CustomContainer(
        containerWidth: double.infinity,
        containerHeight: double.infinity,
        containerDecoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppIMGs().kFluencyBooksPNG), fit: BoxFit.cover),
            gradient: const LinearGradient(colors: [AppColors.kFirstGradientColor, AppColors.kSecondGradientColor])),
        containerChild: Center(
            child: SvgPicture.asset(AppIMGs().kFluencyLogoSVG, fit: BoxFit.cover,)),
      ),
    );
  }
}
