import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Features/home/presentation/widgets/custom_bnb.dart';
import 'package:fluency/Features/home/presentation/widgets/custom_widgets_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget
{
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>
{
  int selectedWidgetIndex = 2;

  void onItemTapped(int index)
  {
    setState(() {selectedWidgetIndex = index;});
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: pages[selectedWidgetIndex],

      bottomNavigationBar: CustomBottomNavBar
      (
        selectedIndex: selectedWidgetIndex,
        onItemTapped: onItemTapped,
      ),

      floatingActionButton: FloatingActionButton
      (
        shape: const CircleBorder(),
        child: Image.asset(AppIMGs().kFluencyBNBAddIconPNG, fit: BoxFit.cover),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


