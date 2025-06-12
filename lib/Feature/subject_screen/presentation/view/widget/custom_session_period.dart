import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes_manager/page_routes.dart';

import '../../../../../core/Utils/colors_manager.dart';
import '../../../../../core/Utils/font_manager.dart';
import '../../../../../domain/entity/get_all_instructor_courses_response_entity.dart';

class CustomSessionPeriod extends StatelessWidget {
  const CustomSessionPeriod({
    super.key,
    required this.text,
    required this.courseEntity,
  });

  final String text;
  final InstructorCoursesListEntity courseEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context, 
          PagesRoutes.sessionScreen,
          arguments: courseEntity
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .04,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorsManager.brown,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: ColorsManager.blackColor,
            fontSize: FontSize.s16,
            fontWeight: FontWeightManager.semiBold,
          ),
        ),
      ),
    );
  }
}
