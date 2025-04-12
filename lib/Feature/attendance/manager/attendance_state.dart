import 'package:graduation_project/domain/entity/get_all_course_student_response_entity.dart';

sealed class AttendanceState {}
class AttendanceLoadingState extends AttendanceState{}
class AttendanceSuccessState extends AttendanceState{
  AttendanceCourseDetailsEntity attendance;
  AttendanceSuccessState(this.attendance);
}
class AttendanceErrorState extends AttendanceState{
  String errorMessage;
  AttendanceErrorState(this.errorMessage);
}