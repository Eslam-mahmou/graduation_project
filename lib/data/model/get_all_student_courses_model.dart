
import '../../domain/entity/get_all_student_courses_response_entity.dart';

class GetAllStudentCoursesResponseModel extends GetAllStudentCoursesResponseEntity{
  GetAllStudentCoursesResponseModel({
      super.statusCode,
      super.message,
      super.data,});

  GetAllStudentCoursesResponseModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? GetStudentDataModel.fromJson(json['data']) : null;
  }

}

class GetStudentDataModel extends GetStudentDataEntity{
  GetStudentDataModel({
      super.count,
      super.allStudentCourses,});

  GetStudentDataModel.fromJson(dynamic json) {
    count = json['count'];
    if (json['allCourseDtos'] != null) {
      allStudentCourses = [];
      json['allCourseDtos'].forEach((v) {
        allStudentCourses?.add(StudentCoursesModel.fromJson(v));
      });
    }
  }


}

class StudentCoursesModel  extends StudentCoursesEntity{
  StudentCoursesModel({
      super.id,
      super.name,});

  StudentCoursesModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }


}