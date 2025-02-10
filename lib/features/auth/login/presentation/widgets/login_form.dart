// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/widgets/containers/custom_container.dart';
import 'package:fluency/Features/auth/login/data/repository/auth_repository.dart';
import 'package:fluency/Features/auth/login/domain/entites/auth_entity.dart';
import 'package:fluency/config/router/app_router.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:fluency/core/utils/validators.dart';
import 'package:fluency/core/widgets/buttons/custom_button.dart';
import 'package:fluency/core/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class LoginForm extends StatefulWidget
{
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
{
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthRepository authRepository = AuthRepository();

  bool obscureText = true;
  bool isLoading = false;

  @override
  void dispose()
  {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async
  {
    if (loginFormKey.currentState!.validate())
    {
      setState(() {isLoading = true;});

      try
      {
        final email = emailController.text;
        final password = passwordController.text;

        final AuthEntity authEntity = await authRepository.login(email, password);

        print('Logged in successfully: ${authEntity.email}');

        GoRouter.of(context).push(AppRouter.kNotificationsView); 
      }

      catch (e)
      {
        print('Login failed: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e'), backgroundColor: Colors.red,),);
      }

      finally
      {
        setState(() {isLoading = false;});
      }
      
    }
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
              CustomContainer(
                containerDecorationColor: AppColors.kLoginFormContainerBGColor,
                containerMargin: AppPadding().kLoginFormMargin,
                containerPadding: AppPadding().kLoginFormPadding,
                containerWidth: 327.w,
                containerHeight: 367.h,
                containerDecoration: BoxDecoration(color: AppColors.kLoginFormBoxDecorationColor, borderRadius: AppBorders().radiusCircular24,),
                containerChild: Form(
                  key: loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      24.verticalSpace,

                      Text('Welcome back!', style: Styles.textStyle24, textAlign: TextAlign.center,),

                      24.verticalSpace,

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          Text('Mobile or Email', style: Styles.textStyle14,),
                      
                          8.verticalSpace,
                      
                          CustomTextFormField(
                            fieldController: emailController,
                            fieldValidator: LoginValidator().validateEmail,
                            fieldKeyboardType: TextInputType.emailAddress,
                            fieldObscureText: false,
                            fieldHintText: "Enter your mobile or email",
                          ),
                      
                          16.verticalSpace,
                      
                          Text('Password', style: Styles.textStyle14,),
                      
                          8.verticalSpace,
                      
                          CustomTextFormField(
                            fieldObscureText: obscureText,
                            fieldContentPadding: AppPadding().kPasswordFieldContentPadding,
                            fieldController: passwordController,
                            fieldValidator: LoginValidator().validatePassword,
                            fieldKeyboardType: TextInputType.text,
                            fieldSuffixIcon: GestureDetector(
                              onTap: (){setState(() {obscureText = !obscureText;});},
                              child: Image.asset(AppIMGs().kFluencyObsecureTextIconPNG)
                            ),
                            fieldHintText: "************",
                          ),
                      
                          Padding(padding: AppPadding().kForgetPasswordPaddingD,
                          child: Align(
                            alignment: Alignment.centerRight,
                              child: Text('Forget Password?', style: Styles.textStyle14.copyWith(decoration: TextDecoration.underline, color: AppColors.kForgetPasswordColor,),),
                            ),
                          ),
                      
                          24.verticalSpace,
                      
                          Center(child: CustomPurpleButton(buttonOnPressed: login, buttonText: 'Login',)), //HERE
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              24.verticalSpace,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text('Don`t have an account?', style: TextStyle(color: AppColors.kDontHaveAccountColor, fontSize: 12.sp, fontWeight: FontWeight.bold,),),

                  3.horizontalSpace,

                  GestureDetector(
                    onTap: () {GoRouter.of(context).push(AppRouter.kNotificationsView);},
                    child: Text('Sign up', style: TextStyle(color: AppColors.kFirstGradientColor, fontWeight: FontWeight.bold, fontSize: 14.sp,),
                    ),
                  ),
                ],
              ),
            ],
          ),

          if (isLoading)
            const Center(child: CircularProgressIndicator(),),
        ],
      ),
    );
  }
}


// Container(
//                 margin: AppPadding().kLoginFormMargin,
//                 padding: AppPadding().kLoginFormPadding,
//                 width: 327.w,
//                 height: 367.h,
//                 decoration: BoxDecoration(color: AppColors.kLoginFormBoxDecorationColor, borderRadius: AppBorders().radiusCircular24,),

//                 child: Form(
//                   key: loginFormKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children:
//                     [
//                       24.verticalSpace,

//                       Text('Welcome back!', style: Styles.textStyle24, textAlign: TextAlign.center,),

//                       24.verticalSpace,

//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children:
//                         [
//                           Text('Mobile or Email', style: Styles.textStyle14,),
                      
//                           8.verticalSpace,
                      
//                           CustomTextFormField(
//                             fieldController: emailController,
//                             fieldValidator: LoginValidator().validateEmail,
//                             fieldKeyboardType: TextInputType.emailAddress,
//                             fieldObscureText: false,
//                             fieldHintText: "Enter your mobile or email",
//                           ),
                      
//                           16.verticalSpace,
                      
//                           Text('Password', style: Styles.textStyle14,),
                      
//                           8.verticalSpace,
                      
//                           CustomTextFormField(
//                             fieldObscureText: obscureText,
//                             fieldController: passwordController,
//                             fieldValidator: LoginValidator().validatePassword,
//                             fieldKeyboardType: TextInputType.text,
//                             fieldSuffixIcon: GestureDetector(
//                               onTap: (){setState(() {obscureText = !obscureText;});},
//                               child: Image.asset(AppIMGs().kFluencyObsecureTextIconPNG)
//                             ),
//                             fieldHintText: "************",
//                           ),
                      
//                           Padding(padding: AppPadding().kForgetPasswordPaddingD,
//                           child: Align(
//                             alignment: Alignment.centerRight,
//                               child: Text('Forget Password?', style: Styles.textStyle14.copyWith(decoration: TextDecoration.underline, color: AppColors.kForgetPasswordColor,),),
//                             ),
//                           ),
                      
//                           24.verticalSpace,
                      
//                           CustomPurpleButton(buttonOnPressed: login, buttonText: 'Login',), //HERE
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),