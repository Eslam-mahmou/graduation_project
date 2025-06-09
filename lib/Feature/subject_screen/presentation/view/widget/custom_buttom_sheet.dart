import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes_manager/page_routes.dart';
import 'package:graduation_project/domain/entity/get_all_instructor_courses_response_entity.dart';

import '../../../../../core/Utils/colors_manager.dart';
import '../../../../../core/Utils/font_manager.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.courseEntity});

  final InstructorCoursesListEntity courseEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .18,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                PagesRoutes.sessionScreen,
                arguments: courseEntity,
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * .06,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "Start Session",
                style: TextStyle(
                  color: ColorsManager.blackColor,
                  fontSize: FontSize.s16,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                PagesRoutes.attendanceScreen,
                arguments: courseEntity,
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * .06,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "Subject Details",
                style: TextStyle(
                  color: ColorsManager.blackColor,
                  fontSize: FontSize.s16,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
