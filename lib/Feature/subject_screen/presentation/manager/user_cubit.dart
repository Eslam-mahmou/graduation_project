import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Feature/subject_Screen/presentation/manager/user_state.dart';
import 'package:graduation_project/core/Utils/constant_manager.dart';
import 'package:graduation_project/core/Widget/extract_role.dart';
import 'package:graduation_project/domain/entity/get_all_instructor_courses_response_entity.dart';
import 'package:graduation_project/domain/entity/get_all_student_courses_response_entity.dart';
import 'package:graduation_project/domain/entity/get_student_course_details_response_entity.dart';
import 'package:graduation_project/domain/use_case/user_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserViewModel extends Cubit<UserState> {
  UserViewModel(this._userUseCase) : super(StudentLoadingState());
  List<CoursesStudentListEntity> studentCourses =[];
  List<InstructorCoursesListEntity> instructorCourses = [];
  final UserUseCase _userUseCase;
  StudentCourseDetailsEntity? courseDetails;
  int expandedIndex = 0;
  bool isUserInfoFetched=false;

  Future<void> fetchUser() async {
    JwtHelper.extractRole() == AppConstants.student
        ? fetchStudentCourses()
        .then((value) async {
          return fetchCourseDetails(studentCourses[0].courseId!.toInt());
        })
        : JwtHelper.extractRole() == AppConstants.instructor
        ? fetchInstructorCourses()
        : null;
  }
  void setExpandedIndex(int index) {
    expandedIndex = (expandedIndex == index) ? -1 : index;
    emit(UpdateUIState());
  }

  Future<void> fetchCourseDetails(int id) async {
    emit(StudentCourseDetailsLoadingState());
    final result = await _userUseCase.invokeCourseDetails(id);
    result.fold(
      (error) {
        emit(StudentCourseDetailsErrorState(error.errorMessage));
      },
      (response) {
        courseDetails = response.data;
        emit(StudentCourseDetailsSuccessState(response.data!));
      },
    );
  }

  Future<void> fetchStudentCourses() async {
    emit(StudentLoadingState());
    final result = await _userUseCase.executeStudent();
    result.fold(
      (error) {
        emit(StudentErrorState(error.errorMessage));
      },
      (response) {
        studentCourses = response.data?.allCourse?.values ??[];
         log(studentCourses.toString());
        emit(StudentSuccessState(response.data!));
      },
    );
  }

  Future<void> fetchInstructorCourses() async {
    emit(InstructorLoadingState());
    final result = await _userUseCase.executeInstructor();
    result.fold(
      (error) {
        emit(InstructorErrorState(error.errorMessage));
      },
      (response) {
        instructorCourses = response.data?.allInstructorCourses?.values??[];
        emit(InstructorSuccessState(response.data!));
      },
    );
  }

  Future<void> fetchUserInfo() async {
    emit(UserInfoLoadingState());
    final result = await _userUseCase.invokeUserInfo();
    result.fold(
      (error) {
        emit(UserInfoErrorState(error.errorMessage));
      },
      (response) {
        emit(UserInfoSuccessState(response.data!));
      },
    );
  }
}
