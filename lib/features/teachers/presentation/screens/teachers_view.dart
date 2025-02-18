import 'package:fluency/Core/utils/styles.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_card.dart';
import 'package:fluency/Core/widgets/ListView_Builder/custom_listbuilder.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeachersView extends StatelessWidget
{
  const TeachersView({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children:
            [
              const CustomTeachersAppBar(),
          
              26.verticalSpace,
          
              Text("Teachers", style: Styles.textStyle20, textAlign: TextAlign.center,),
              
          
              35.verticalSpace,
          
              CustomListBuilder(
                listItemBuilder: (context, index) => CustomTeachersCard(teacherIMGPath: teacherIMGPath, teacherName: teacherName, teacherNameSubtitle: teacherNameSubtitle, flagIMGPath: flagIMGPath, countryText: countryText, accentText: accentText),
                listseparatorBuilder: (context, index) => 24.verticalSpace,
                listItemCount: 2,
              ),
            ],
          ),
        ),
    );
  }
}

