class GetAllCourseStudentResponseEntity {
  GetAllCourseStudentResponseEntity({
      this.statusCode, 
      this.message, 
      this.data,});

  num? statusCode;
  String? message;
  AttendanceCourseDetailsEntity? data;

}

class AttendanceCourseDetailsEntity {
  AttendanceCourseDetailsEntity({
      this.name, 
      this.totalDays, 
      this.regiseteredStudentCount, 
      this.studentWithAttendanceDtos,});
  String? name;
  num? totalDays;
  num? regiseteredStudentCount;
  List<StudentAttendanceEntity>? studentWithAttendanceDtos;

}

class StudentAttendanceEntity {
  StudentAttendanceEntity({
      this.id, 
      this.name, 
      this.attendance,});
  num? id;
  String? name;
  num? attendance;


}