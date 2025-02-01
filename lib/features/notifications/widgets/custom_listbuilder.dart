import 'package:flutter/material.dart';

class CustomListViewSeparatedBuilder extends StatelessWidget
{
  const CustomListViewSeparatedBuilder({super.key,
  required this.listItemCount,
  required this.listReturnedWidget,
  required this.listSeparatorWidget});

  final int listItemCount;
  final Widget listReturnedWidget;
  final Widget listSeparatorWidget;

  @override
  Widget build(BuildContext context)
  {
    return ListView.separated(
      itemBuilder: (context, index)
      {
        return listReturnedWidget;
      },

      itemCount: listItemCount,
      shrinkWrap: true,

      separatorBuilder: (context, index)
      {
        return listSeparatorWidget;
      },
    );
  }
}