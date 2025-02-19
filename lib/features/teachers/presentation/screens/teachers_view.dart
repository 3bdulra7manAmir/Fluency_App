import 'package:fluency/Core/utils/styles.dart';
import 'package:fluency/Core/widgets/listview_builder/custom_listbuilder.dart';
import 'package:fluency/Features/teachers/presentation/controllers/teacher_controller.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_bms.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_card.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeachersView extends ConsumerWidget
{
  const TeachersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    final teachersListAsync = ref.watch(teachersListProvider);
    return Scaffold(
      body: Column(
        children:
        [
          const CustomTeachersAppBar(),

          26.verticalSpace,

          Text("Teachers", style: Styles.textStyle20, textAlign: TextAlign.center,),

          35.verticalSpace,

          teachersListAsync.when(
            data: (teachers) => Expanded(
              child: CustomListBuilder(
                listItemCount: teachers.length,
                listItemBuilder: (context, index) {
                  final teacher = teachers[index];
                  return GestureDetector(
                    onTap: () {
                      CustomTeachersBMS.show(
                        context,
                        teacherIMGPath: teacher.photo,
                        flagIMGPath: "assets/images/png/Teachers_View_EG_Flag.png",
                        teacherName: teacher.name,
                        teacherNameSubtitle: teacher.headline,
                        countryText: teacher.nationality ?? "N/A",
                        accentText: teacher.accent ?? "N/A",
                      );
                    },
                    child: CustomTeachersCard(
                      teacherIMGPath: teacher.photo,
                      teacherName: teacher.name,
                      teacherNameSubtitle: teacher.headline,
                      flagIMGPath: "assets/images/png/Teachers_View_EG_Flag.png",
                      countryText: teacher.nationality ?? "N/A",
                      accentText: teacher.accent ?? "N/A",
                    ),
                  );
                },
                listseparatorBuilder: (context, index) => const SizedBox(height: 10),
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          ),
        ],
      ),
    );
  }
}