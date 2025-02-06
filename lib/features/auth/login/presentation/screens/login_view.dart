import 'package:fluency/Features/auth/login/presentation/widgets/login_sector.dart';
import 'package:fluency/Features/auth/login/presentation/widgets/purple_sector.dart';
import 'package:fluency/Features/auth/login/presentation/widgets/white_sector.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget
{
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
{
  @override
  Widget build(BuildContext context)
  {
    return const Scaffold(
      body: Stack(
        children:
        [
          TwoStacksColumn(),
      
          LoginColumn(),
        ],
      ),
    );
  }
}




class TwoStacksColumn extends StatelessWidget
{
  const TwoStacksColumn({super.key,});

  @override
  Widget build(BuildContext context)
  {
    return const Column(
      children:
      [
        Expanded(child: FirstPurpleStack()),

        Expanded(child: SecondWhiteStack()),
      ],
    );
  }
}