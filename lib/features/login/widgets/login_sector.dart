import 'package:fluency/core/utils/constants.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginColumn extends StatelessWidget
{
  const LoginColumn({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Stack(
        children:
        [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Container(
                width: KMediaQuery(context).width * 0.87,
                height: 330.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r)
                ),
                child: Column(
                  children:
                  [
                    const SizedBox(height: 24,),

                    Text('Welcome back!', style: Styles.textStyle24,),

                    const SizedBox(height: 24,),

                    
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}