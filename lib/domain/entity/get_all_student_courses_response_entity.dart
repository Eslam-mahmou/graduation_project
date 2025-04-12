class GetAllStudentCoursesResponseEntity {
  GetAllStudentCoursesResponseEntity({
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
      this.allStudentCourses,});


  num? count;
  List<StudentCoursesEntity>? allStudentCourses;


}

class StudentCoursesEntity {
  StudentCoursesEntity({
      this.id, 
      this.name,});
  num? id;
  String? name;
}