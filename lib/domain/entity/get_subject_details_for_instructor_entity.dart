class GetSubjectDetailsForInstructorEntity {
  GetSubjectDetailsForInstructorEntity({
      this.statusCode, 
      this.message, 
      this.data,});

  num? statusCode;
  String? message;
  GetDataSubjectDetailsInstructorEntity? data;

}

class GetDataSubjectDetailsInstructorEntity {
  GetDataSubjectDetailsInstructorEntity({
      this.name, 
      this.totalLectures, 
      this.regiseteredStudentCount, 
      this.studentWithAttendanceDtos,});
  String? name;
  num? totalLectures;
  num? regiseteredStudentCount;
  StudentWithAttendanceEntity? studentWithAttendanceDtos;
}

class StudentWithAttendanceEntity {
  StudentWithAttendanceEntity({
      this.values,});
  List<StudentWithAttendanceListEntity>? values;

}

class StudentWithAttendanceListEntity {
  StudentWithAttendanceListEntity({
      this.id,
      this.name, 
      this.attendance, 
      this.code,});

  num? id;
  String? name;
  num? attendance;
  String? code;

}