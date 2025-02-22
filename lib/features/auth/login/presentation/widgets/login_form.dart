
import 'package:fluency/Core/services/validation/validators.dart';
import 'package:fluency/Features/auth/login/presentation/controller/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluency/Core/constants/app_borders.dart';
import 'package:fluency/Core/constants/app_colors.dart';
import 'package:fluency/Core/constants/app_padding.dart';
import 'package:fluency/Core/widgets/containers/custom_container.dart';
import 'package:fluency/config/router/app_router.dart';
import 'package:fluency/core/utils/styles.dart';
import 'package:fluency/core/widgets/buttons/custom_button.dart';
import 'package:fluency/core/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends ConsumerWidget
{
  LoginForm({super.key});

  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    final authController = ref.watch(authControllerProvider);

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
                containerMargin: AppPadding().k24Horizontal,
                containerPadding: AppPadding().k16Horizontal,
                containerWidth: 327.w,
                //containerHeight: 367.h,
                containerDecoration: BoxDecoration(
                  color: AppColors.kLoginFormBoxDecorationColor,
                  borderRadius: AppBorders().radiusCircular24,
                ),
                
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
                          Text('Mobile or Email', style: Styles.textStyle14),

                          8.verticalSpace,

                          CustomTextFormField(
                            fieldController: emailController,
                            fieldValidator: LoginValidator().validateEmail,
                            fieldKeyboardType: TextInputType.emailAddress,
                            fieldObscureText: false,
                            fieldHintText: "Enter your mobile or email",
                          ),

                          16.verticalSpace,

                          Text('Password', style: Styles.textStyle14),

                          8.verticalSpace,

                          CustomTextFormField(
                            fieldContentPadding: AppPadding().k16Start,
                            fieldObscureText: authController.isLoading,
                            fieldController: passwordController,
                            fieldValidator: LoginValidator().validatePassword,
                            fieldKeyboardType: TextInputType.text,
                            fieldHintText: "************",
                          ),

                          Padding(
                            padding: AppPadding().k16Start8Top,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('Forget Password?', style: Styles.textStyle14.copyWith(
                                decoration: TextDecoration.underline,
                                color: AppColors.kForgetPasswordColor,
                                ),
                              ),
                            ),
                          ),

                          24.verticalSpace,

                          Center(
                            child: CustomPurpleButton(
                              buttonIconIsEnabled: false,
                              buttonOnPressed: () async
                              {
                                if (loginFormKey.currentState!.validate())
                                {
                                  await ref.read(authControllerProvider.notifier).login(emailController.text, passwordController.text,);
                                  if (authController.authEntity != null)
                                  {
                                    GoRouter.of(context).push(AppRouter.kNotificationsView);
                                  }
                                }
                              },
                              buttonText: 'Login',
                            ),
                          ),
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
                    onTap: ()
                    {
                      GoRouter.of(context).push(AppRouter.kNotificationsView);
                    },
                    child: Text('Sign up', style: TextStyle(color: AppColors.kFirstGradientColor, fontWeight: FontWeight.bold, fontSize: 14.sp,),),
                  ),
                ],
              ),
            ],
          ),
          if (authController.isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
