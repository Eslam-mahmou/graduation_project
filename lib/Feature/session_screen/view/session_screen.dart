import 'package:flutter/material.dart';

import '../../../core/Utils/colors_manager.dart';
import '../../../core/Utils/font_manager.dart';
import '../../../domain/entity/get_all_instructor_courses_response_entity.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var arg =
        ModalRoute.of(context)!.settings.arguments
            as InstructorCoursesListEntity;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text(
          arg.name.toString(),
          style: TextStyle(
            color: ColorsManager.blackColor,
            fontSize: FontSize.s20,
            fontWeight: FontWeightManager.bold,
          ),
        ),
       actions: [
         Text("")
       ],
      ),
      body: Column(

        children: [
          SizedBox(
            height: height *.08,
          ),
          Container(
            margin:EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            width: double.infinity,
            height: height *.07,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text("Start Session",
              style: TextStyle(
                color: ColorsManager.blackColor,
                fontSize: FontSize.s20,
                fontWeight: FontWeightManager.bold,
              ),
          )),
          Container(
              margin:EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              width: double.infinity,
              height: height *.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text("Start Session",
                style: TextStyle(
                  color: ColorsManager.blackColor,
                  fontSize: FontSize.s20,
                  fontWeight: FontWeightManager.bold,
                ),
              )),
          Container(
              margin:EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              width: double.infinity,
              height: height *.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text("Start Session",
                style: TextStyle(
                  color: ColorsManager.blackColor,
                  fontSize: FontSize.s20,
                  fontWeight: FontWeightManager.bold,
                ),
              ))
        ],
      ),
    );
  }
}
