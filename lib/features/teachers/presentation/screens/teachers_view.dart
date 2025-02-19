import 'package:fluency/Core/constants/app_images.dart';
import 'package:fluency/Core/utils/styles.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_bms.dart';
import 'package:fluency/Features/teachers/presentation/widgets/custom_teachers_card.dart';
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
      body: Column(
        children:
        [
          const CustomTeachersAppBar(),

          26.verticalSpace,

          Text("Teachers", style: Styles.textStyle20, textAlign: TextAlign.center,),

          35.verticalSpace,

          GestureDetector(
            onTap: (){
              CustomTeachersBMS.show(context,
              teacherIMGPath: AppIMGs().kFluencyTeacherViewTeacherPNG,
              flagIMGPath: AppIMGs().kFluencyTeachersViewEGFlagPNG,
              teacherName: "Mohamed Halwani",
              teacherNameSubtitle: "A passionate ESL & IELTS instructor with 8+ years of experience with the mission of opening the world through education.",
              countryText: "Egypt",
              accentText: "American",
              );
            },
      
            child: CustomTeachersCard(
              teacherIMGPath: AppIMGs().kFluencyTeacherViewTeacherPNG,
              teacherName: "Mohamed Halwani",
              teacherNameSubtitle: "ESL & IELTS instructor",
              flagIMGPath: AppIMGs().kFluencyTeachersViewEGFlagPNG,
              countryText: "Egypt",
              accentText: "American",
              ),
            ),

            
          // CustomListBuilder(
          //   listItemBuilder: (context, index) => CustomTeachersCard(
          //       teacherIMGPath: teacherIMGPath,
          //       teacherName: teacherName,
          //       teacherNameSubtitle: teacherNameSubtitle,
          //       flagIMGPath: flagIMGPath,
          //       countryText: countryText,
          //       accentText: accentText),
          //   listseparatorBuilder: (context, index) => 24.verticalSpace,
          //   listItemCount: 2,
          // ),
        ],
      ),
    );
  }
}
