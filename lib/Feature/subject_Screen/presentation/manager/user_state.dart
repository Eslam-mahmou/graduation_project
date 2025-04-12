import 'package:graduation_project/domain/entity/get_all_instructor_courses_response_entity.dart';
import 'package:graduation_project/domain/entity/get_all_student_courses_response_entity.dart';
import 'package:graduation_project/domain/entity/get_user_info_response_entity.dart';

import '../../../../domain/entity/get_student_course_details_response_entity.dart';

sealed class UserState {

}
class StudentLoadingState extends UserState{}
class StudentErrorState extends UserState{
  final String errorMessage;
  StudentErrorState(this.errorMessage);
}
class StudentSuccessState extends UserState{
  GetStudentDataEntity studentDataEntity;
  StudentSuccessState(this.studentDataEntity);
}
class InstructorLoadingState extends UserState{}
class InstructorErrorState extends UserState{
  final String errorMessage;
  InstructorErrorState(this.errorMessage);
}
class InstructorSuccessState extends UserState{
  GetInstructorDataEntity instructorDataEntity;
  InstructorSuccessState(this.instructorDataEntity);
}
class StudentCourseDetailsLoadingState extends UserState{}
class StudentCourseDetailsErrorState extends UserState{
  final String errorMessage;
  StudentCourseDetailsErrorState(this.errorMessage);
}
class StudentCourseDetailsSuccessState extends UserState{
  StudentCourseDetailsEntity courseDetails;
  StudentCourseDetailsSuccessState(this.courseDetails);
}
class UserInfoLoadingState extends UserState{}
class UserInfoErrorState extends UserState{
  final String errorMessage;
  UserInfoErrorState(this.errorMessage);
}
class UserInfoSuccessState extends UserState{
  UserDataInfoEntity userInfoEntity;
  UserInfoSuccessState(this.userInfoEntity);
}