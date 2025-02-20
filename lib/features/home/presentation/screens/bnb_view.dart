import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Features/home/presentation/widgets/custom_bnb.dart';
import 'package:fluency/Features/home/presentation/widgets/custom_widgets_list.dart';
import 'package:fluency/Features/home/presentation/controllers/bnb_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget
{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    final selectedWidgetIndex = ref.watch(bnbProvider);

    return Scaffold(
      body: pages[selectedWidgetIndex],

      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedWidgetIndex,
        onItemTapped: (index) => ref.read(bnbProvider.notifier).setIndex(index),
      ),

      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        child: Image.asset(AppIMGs().kFluencyBNBAddIconPNG, fit: BoxFit.cover),
        onPressed: () {},
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
