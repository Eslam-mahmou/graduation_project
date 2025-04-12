class GetStudentCourseDetailsResponseEntity {
  GetStudentCourseDetailsResponseEntity({
      this.statusCode, 
      this.message, 
      this.data,});

  num? statusCode;
  String? message;
  StudentCourseDetailsEntity? data;

}

class StudentCourseDetailsEntity {
  StudentCourseDetailsEntity({
      this.name, 
      this.totalDays, 
      this.attendance,});
  String? name;
  num? totalDays;
  num? attendance;

}