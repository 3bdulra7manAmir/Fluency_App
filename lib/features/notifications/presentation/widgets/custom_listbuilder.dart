import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListViewSeparatedBuilder extends StatelessWidget
{
  const CustomListViewSeparatedBuilder({
    super.key,
    required this.listItemCount,
    required this.listReturnedWidget,
    required this.listSeparatorWidget,
  });

  final int listItemCount;
  final Widget Function(BuildContext, int) listReturnedWidget; 
  final Widget listSeparatorWidget;

  @override
  Widget build(BuildContext context)
  {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      itemBuilder: listReturnedWidget,
      itemCount: listItemCount,
      shrinkWrap: true,
      separatorBuilder: (context, index)
      {
        return listSeparatorWidget;
      },
    );
  }
}