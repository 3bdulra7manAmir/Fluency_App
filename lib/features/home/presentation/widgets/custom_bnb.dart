import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget
{
  const CustomBottomNavBar({super.key, required this.selectedIndex, required this.onItemTapped,});

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context)
  {
    return BottomAppBar(
      color: AppColors.kLoginFormContainerBGColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
        [
          buildNavItem('Home', 
              'assets/images/png/Teacher_View_Home_Fill.png', 
              'assets/images/png/Teacher_View_Home.png', 
              0),
          buildNavItem('Sessions', 
              'assets/images/png/Not_View_VideoScreen_Fill.png', 
              'assets/images/png/Not_View_VideoScreen.png', 
              1),

          48.horizontalSpace, // Space for FAB

          buildNavItem('Teachers', 
              'assets/images/png/Not_View_People_Fill.png', 
              'assets/images/png/Not_View_People.png', 
              2),
          buildNavItem('Profile', 
              'assets/images/png/Not_View_Person_Fill.png', 
              'assets/images/png/Not_View_Person.png', 
              3),
        ],
      ),
    );
  }

  Widget buildNavItem(String iconText, String selectedIconPath, String unSelectedIconPath, int index)
  {
    return InkWell(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:
        [
          Image.asset(selectedIndex == index ? selectedIconPath : unSelectedIconPath, width: 24.w, height: 24.h,),
          Text(iconText, style: Styles.textStyle12.copyWith(color: selectedIndex == index ? AppColors.kFirstGradientColor : AppColors.kTeachersBNBTextColor)),
        ],
      ),
    );
  }
}