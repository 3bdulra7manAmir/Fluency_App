import 'package:fluency/features/login/widgets/login_sector.dart';
import 'package:fluency/features/login/widgets/purple_sector.dart';
import 'package:fluency/features/login/widgets/white_sector.dart';
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
    return Scaffold(
      body: const Stack(
        children:
        [
          //Positioned
          TwoStacksColumn(),
      
          //Positioned //Called First not in the End To Overlay or Overlap Both Stack... become above the 2.
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
        //Expanded 
        Expanded(child: FirstPurpleStack()),

        //Expanded
        Expanded(child: SecondWhiteStack()),
      ],
    );
  }
}