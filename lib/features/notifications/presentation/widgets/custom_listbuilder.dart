import 'package:fluency/Core/constants/app_padding.dart';
import 'package:flutter/material.dart';

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
      padding: AppPadding().kPaddingInsideTheListViewBuilder,
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