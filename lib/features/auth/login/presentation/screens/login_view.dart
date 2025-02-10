import 'package:fluency/Features/auth/login/presentation/widgets/login_form.dart';
import 'package:fluency/Features/auth/login/presentation/widgets/purple_sector.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget
{
  const LoginView({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const Scaffold(
      body: Stack(
        children:
        [
          PurpleStack(),
      
          LoginForm(),
        ],
      ),
    );
  }
}