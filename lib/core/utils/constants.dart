import 'package:flutter/material.dart';


class KMediaQuery
{
  KMediaQuery(this.context);
  final BuildContext context;

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
}

class AppColors
{
  static const Color kFirstGradient = Color(0xff662D91);
  static const Color kSecondGradient = Color(0xff905EB6);
  static const Color kAlmostWhite = Color(0xfff3f5fc);
  static const Color kForgetPassword = Color(0xff4F1993);
  static const Color kDontHaveAccount = Color(0xff777777);
  static const Color kScaffoldBG = Color(0xfff7f6fc);
  static const Color kText = Color(0xff362E3B);

}


class AppIMGs
{
  String kFluencyBooksPNG = 'assets/images/png/Splash_View_Bg.png';
  String kFluencyLoginHatPNG = 'assets/images/png/Login_View_Bg.png';

  String kFluencyLogoSVG = 'assets/images/svg/Fluency_Logo.svg';

  
  String kFluencyBackArrowSVG = 'assets/images/svg/Not_View_BackArrow.svg';
  String kFluencyBackArrowPNG = 'assets/images/png/Not_View_BackArrow.png';
}