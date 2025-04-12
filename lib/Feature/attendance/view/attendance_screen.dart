import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Feature/attendance/manager/attendance_state.dart';
import 'package:graduation_project/Feature/attendance/manager/attendance_view_model.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';
import 'package:graduation_project/core/Widget/custom_diaolg.dart';
import 'package:graduation_project/core/Widget/extract_attendance_precent.dart';
import 'package:graduation_project/di/di.dart';
import 'package:graduation_project/domain/entity/get_all_instructor_courses_response_entity.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<AttendanceViewModel>();
    var arg =
        ModalRoute.of(context)?.settings.arguments as InstructorCoursesEntity;
    return BlocConsumer<AttendanceViewModel, AttendanceState>(
      bloc: viewModel..getAllCourseStudent(arg.id!.toInt()),
      listener: (context, state) {
        if (state is AttendanceErrorState) {
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage,
            title: 'Error',
            postActionName: 'OK',
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsManager.brown,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            foregroundColor: ColorsManager.whiteColor,
            title: Text(
              'Attendance of ${arg.name}',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: ColorsManager.whiteColor,
                  fontSize: FontSize.s20,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
            ),
            backgroundColor: ColorsManager.cayn,
          ),
          body:
              state is AttendanceLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : state is AttendanceSuccessState &&
                      viewModel.attendance.isNotEmpty
                  ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: viewModel.attendance.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ColorsManager.whiteColor,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                                child: Image.asset(
                                  'assets/images/profilePhoto.png',
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                viewModel.attendance[index].name.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: ColorsManager.blackColor,
                                    fontSize: FontSize.s18,
                                    fontWeight: FontWeightManager.semiBold,
                                  ),
                                ),
                              ),
                              Expanded(child: SizedBox(width: 10)),
                              Text(
                                "Attended ${extractAttendancePrecent(state.attendance.totalDays!.toInt(), viewModel.attendance[index].attendance!.toInt()).toInt()}%",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: ColorsManager.blackColor,
                                    fontSize: FontSize.s18,
                                    fontWeight: FontWeightManager.semiBold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                  : Center(
                    child: Text(
                      'No Students For This Course',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: ColorsManager.blackColor,
                          fontSize: FontSize.s20,
                          fontWeight: FontWeightManager.semiBold,
                        ),
                      ),
                    ),
                  ),
        );
      },
    );
  }
}
