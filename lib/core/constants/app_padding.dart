import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding
{
  EdgeInsets kLoginFormMargin = EdgeInsets.symmetric(horizontal: 24.w,);
  EdgeInsets kLoginFormPadding = EdgeInsets.symmetric(horizontal: 16.w);
  EdgeInsets kTextFieldContentPadding = EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w);
  EdgeInsetsDirectional kForgetPasswordPaddingD = EdgeInsetsDirectional.only(end: 16.w, top: 8.h,);


  EdgeInsetsDirectional kNotNewNotificationsMarginD = EdgeInsetsDirectional.only(end: 24.w);
  EdgeInsets kNotNewNotificationsPadding = EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h);
  EdgeInsetsDirectional kNotBackButtonMargin  = EdgeInsetsDirectional.only(start: 24.w);

  EdgeInsets kListSeparatorPadding = EdgeInsets.only(top: 5.h, bottom: 5.h);
  EdgeInsets kPaddingInsideTheListViewBuilder = EdgeInsets.symmetric(vertical: 12.5.h);
  
  EdgeInsets kNotificationsCardPadding = EdgeInsets.symmetric(horizontal: 16.w,); //HERE 24

}