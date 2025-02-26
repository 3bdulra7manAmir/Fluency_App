import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';

class RouterErrorWidget extends StatelessWidget
{
  const RouterErrorWidget({super.key});

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Requested Route Is inValid OR Not Found", style: Styles.textStyle18,),
        ),
      ),
    );
  }
}