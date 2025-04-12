import 'package:graduation_project/domain/entity/get_all_course_student_response_entity.dart';

class GetAllCourseStudentResponseModel extends GetAllCourseStudentResponseEntity{
  GetAllCourseStudentResponseModel({
      super.statusCode,
      super.message,
      super.data,});

  GetAllCourseStudentResponseModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? AttendanceCourseDetailsModel.fromJson(json['data']) : null;
  }
}

class AttendanceCourseDetailsModel extends AttendanceCourseDetailsEntity {
  AttendanceCourseDetailsModel({
      super.name,
      super.totalDays,
      super.regiseteredStudentCount,
      super.studentWithAttendanceDtos,});

  AttendanceCourseDetailsModel.fromJson(dynamic json) {
    name = json['name'];
    totalDays = json['totalDays'];
    regiseteredStudentCount = json['regiseteredStudentCount'];
    if (json['studentWithAttendanceDtos'] != null) {
      studentWithAttendanceDtos = [];
      json['studentWithAttendanceDtos'].forEach((v) {
        studentWithAttendanceDtos?.add(StudentAttendanceModel.fromJson(v));
      });
    }
  }
}

class StudentAttendanceModel  extends StudentAttendanceEntity{
  StudentAttendanceModel({
      super.id,
      super.name,
      super.attendance,});

  StudentAttendanceModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    attendance = json['attendance'];
  }

}