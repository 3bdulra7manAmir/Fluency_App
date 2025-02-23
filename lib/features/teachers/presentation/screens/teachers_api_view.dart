import 'package:fluency/Features/teachers/presentation/controllers/teacher_api_controller.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_api_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CustomTeachersAPIView extends ConsumerWidget {
  const CustomTeachersAPIView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersState = ref.watch(teachersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Session History")),
      body: teachersState.when(
        data: (teachersData) => ListView.builder(
          itemCount: teachersData.length,
          itemBuilder: (context, index) => CustomTeachersAPICard(teachersData: teachersData[index]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("❌ Error: ${err.toString()}")),
      ),
    );
  }
}
