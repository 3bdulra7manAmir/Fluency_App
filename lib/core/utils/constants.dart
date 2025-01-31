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
}

class AppIMGs
{
  String kFluencyBooks = 'assets/images/png/Splash_View_Bg.png';
  String kFluencyLogo = 'assets/images/svg/Fluency_Logo.svg';
  String kFluencyLoginHat = 'assets/images/png/Login_View_Bg.png';
}