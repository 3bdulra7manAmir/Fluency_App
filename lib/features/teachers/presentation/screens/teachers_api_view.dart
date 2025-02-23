import 'package:fluency/Features/teachers/presentation/controllers/teacher_api_controller.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_api_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CustomTeachersAPIView extends ConsumerWidget {
  const CustomTeachersAPIView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionState = ref.watch(sessionProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Session History")),
      body: sessionState.when(
        data: (sessions) => ListView.builder(
          itemCount: sessions.length,
          itemBuilder: (context, index) => CustomTeachersAPICard(session: sessions[index]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("❌ Error: ${err.toString()}")),
      ),
    );
  }
}
