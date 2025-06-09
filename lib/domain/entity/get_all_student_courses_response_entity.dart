class GetAllCoursesStudentResponseEntity {
  GetAllCoursesStudentResponseEntity({
    this.statusCode,
    this.message,
    this.data,});

  num? statusCode;
  String? message;
  GetStudentDataEntity? data;


}

class GetStudentDataEntity {
  GetStudentDataEntity({
    this.count,
    this.allCourse,});
  num? count;
  StudentCoursesEntity? allCourse;


}

class StudentCoursesEntity {
  StudentCoursesEntity({
    this.values,});

  List<CoursesStudentListEntity>? values;


}

class CoursesStudentListEntity {
  CoursesStudentListEntity({
    this.courseId,
    this.name,});

  num? courseId;
  String? name;

}