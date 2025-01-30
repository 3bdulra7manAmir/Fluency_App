// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';


class KMediaQuery
{
  KMediaQuery(this.context);
  final BuildContext context;

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
}

const String kGtSectraFine = 'GT Sectra Fine';

class AppColors
{
  static const Color kCardColorPinkCardContainer = Color(0xffFFE7EE);
  static const Color kCardColorPinkLinearLine = Color(0xffEC7B9C);

  static const Color kCardColorBlueCardContainer = Color(0xffBAD6FF);
  static const Color kCardColorBlueLinearLine = Color(0xff3D5CFF);

  static const Color kCardColorGreenCardContainer = Color(0xffBAE0DB);
  static const Color kCardColorGreenLinearLine = Color(0xff398A80);

  Color kButtonsBlueColor = Color.fromRGBO(61, 93, 255, 1);

  static const Color kScaffoldBackgoundColorWhite = Colors.white;
  static const Color kTest = Colors.red;
}

class AppAssetsPaths
{
  String kBBIMGPath = 'assets/images/svg/Eye.svg';
  String kFlippedBBIMGPath = 'assets/images/svg/EyeFlipped.svg';
  String kProfileAvatarWithoutCameraPath = 'assets/images/svg/Profile_Avatar_Without_Camera.svg';
}