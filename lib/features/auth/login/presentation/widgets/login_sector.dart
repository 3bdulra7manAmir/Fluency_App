import 'package:fluency/config/router/app_router.dart';
import 'package:fluency/core/constants/app_colors.dart';
import 'package:fluency/core/constants/app_responsive.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:fluency/core/utils/validators.dart';
import 'package:fluency/core/widgets/buttons/custom_button.dart';
import 'package:fluency/core/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginColumn extends StatefulWidget
{
  const LoginColumn({super.key});

  @override
  State<LoginColumn> createState() => _LoginColumnState();
}

class _LoginColumnState extends State<LoginColumn>
{
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //TO PREVENT Memory leak //Tharwat Samy...
  @override
  void dispose()
  {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                height: 340.h,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24.r)),
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      const SizedBox(height: 24,),
                  
                      Align(
                        alignment: Alignment.center,
                        child: Text('Welcome back!', style: Styles.textStyle24,)
                      ),
                  
                      const SizedBox(height: 24,),

                      Padding(
                        padding: EdgeInsets.only(left: KMediaQuery(context).width * 0.06),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text('Mobile or Email', style: Styles.textStyle14,),

                            const SizedBox(height: 8,),

                            CustomTextFormField(
                              fieldController: emailController,
                              fieldValidator: LoginValidator().validateEmail,
                              fieldKeyboardType: TextInputType.emailAddress,
                              fieldObscureText: false,
                              fieldHintText: "Enter your mobile or email",

                            ),

                            const SizedBox(height: 15,),

                            Text('Password', style: Styles.textStyle14,),

                            const SizedBox(height: 8,),

                            CustomTextFormField(
                              fieldController: passwordController,
                              fieldValidator: LoginValidator().validatePassword,
                              fieldKeyboardType: TextInputType.text,
                              fieldObscureText: true,
                              fieldSuffixIcon: Image.asset('assets/images/png/Login_View_Eye.png',),
                              fieldHintText: "************",
                            ),

                            Padding(
                              padding: EdgeInsets.only(right: KMediaQuery(context).width * 0.06, top: 10.h),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('Forget Password?', style: Styles.textStyle14.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.kForgetPassword,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20,),

                            CustomPurpleButton(
                              buttonOnPressed: () {},
                              buttonText: "Login",
                              buttonWidth: 0.75,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text('Don`t have account?', style: TextStyle(color: AppColors.kDontHaveAccount, fontSize: 12.sp, fontWeight: FontWeight.bold),),
                  const SizedBox(width: 3,),
                  GestureDetector(
                    onTap: (){GoRouter.of(context).push(AppRouter.kNotificationsView);},
                    child: Text('Sign up', style: TextStyle(color: AppColors.kFirstGradient, fontWeight: FontWeight.bold, fontSize: 14.sp),)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

