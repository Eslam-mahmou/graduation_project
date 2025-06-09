import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';
import 'package:graduation_project/core/Widget/extract_attendance_precent.dart';
import 'package:graduation_project/domain/entity/get_all_student_courses_response_entity.dart';

import '../../data/model/get_all_student_courses_response_model.dart';
import '../../domain/entity/get_student_course_details_response_entity.dart';

class CustomSubjectCard extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onTap;
final  StudentCourseDetailsEntity ? studentCourse;
 final CoursesStudentListEntity? courseName;
  const CustomSubjectCard({
    Key? key,
    required this.isExpanded,
    required this.onTap,
    required this.studentCourse,
    required this.courseName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num absent=(studentCourse?.totalDays ?? 0) - (studentCourse?.attendance ?? 0) ;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: ColorsManager.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              courseName!.name.toString(),
              style: GoogleFonts.roboto(
                textStyle:
                TextStyle(
                    fontWeight: FontWeightManager.medium,
                    fontSize: FontSize.s18,
                    color: Colors.white),
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            onTap: onTap,
          ),
          // Expanded content
          if (isExpanded)
            Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total Lectures',
                        style:  GoogleFonts.roboto(
                          textStyle:
                          TextStyle(
                              fontWeight: FontWeightManager.regular,
                              fontSize: FontSize.s16,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("${studentCourse?.totalDays??0}",style:  TextStyle(
                          fontWeight: FontWeightManager.regular,
                          fontSize: FontSize.s16,
                          color: Colors.white),)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Present',
                        style:  GoogleFonts.roboto(
                          textStyle:
                          TextStyle(
                              fontWeight: FontWeightManager.regular,
                              fontSize: FontSize.s16,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("${studentCourse?.attendance??0}",style:  TextStyle(
                          fontWeight: FontWeightManager.regular,
                          fontSize: FontSize.s16,
                          color: Colors.white),)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Absent",
                        style:  GoogleFonts.roboto(
                          textStyle:
                          TextStyle(
                              fontWeight: FontWeightManager.regular,
                              fontSize: FontSize.s16,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(absent.toString(),style:  TextStyle(
                          fontWeight: FontWeightManager.regular,
                          fontSize: FontSize.s16,
                          color: Colors.white),)
                    ],
                  ),

                  SizedBox(height: 12),
                ],
              ),
            ),
        ],
      ),
    );
  }
}