
import 'package:graduation_project/domain/entity/get_subject_details_for_instructor_entity.dart';


sealed class AttendanceState {}
class AttendanceLoadingState extends AttendanceState{}
class AttendanceSuccessState extends AttendanceState{
  GetDataSubjectDetailsInstructorEntity attendance;
  AttendanceSuccessState(this.attendance);
}
class AttendanceErrorState extends AttendanceState{
  String errorMessage;
  AttendanceErrorState(this.errorMessage);
}