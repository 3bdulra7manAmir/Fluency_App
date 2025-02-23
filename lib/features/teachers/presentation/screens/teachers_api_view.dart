import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/utils/styles.dart';
import 'package:fluency/Core/widgets/listview_builder/custom_listbuilder.dart';
import 'package:fluency/Features/teachers/data/models/teachers_list_model/teachers_list_model.dart';
import 'package:fluency/Features/teachers/presentation/controllers/teacher_api_controller.dart';
import 'package:fluency/Features/teachers/presentation/controllers/teacher_controller.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_api_card.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_card.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeachersAPIView extends ConsumerWidget {
  const TeachersAPIView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersAPIListAsync = ref.watch(teachersProvider);

    return Scaffold(
      body: Column(
        children:
        [
          const CustomTeachersAppBar(),
          
          26.verticalSpace,

          Text("Teachers", style: Styles.textStyle20, textAlign: TextAlign.center,),

          35.verticalSpace,

          teachersAPIListAsync.when(
            data: (teachers) => Expanded(
              child: CustomListBuilder(
                listItemCount: teachers.length,
                listItemBuilder: (context, index)
                {
                  final teacher = teachers[index];
                  return CustomTeachersAPICard(teachersData: teacher);
                },
                listseparatorBuilder: (context, index) => 10.verticalSpace,
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          ),

          16.verticalSpace,
        ],
      ),
    );
  }
}

