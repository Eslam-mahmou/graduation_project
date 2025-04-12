import 'package:graduation_project/domain/entity/get_student_course_details_response_entity.dart';

class GetStudentCourseDetailsResponseModel extends GetStudentCourseDetailsResponseEntity{
  GetStudentCourseDetailsResponseModel({
      super.statusCode,
      super.message,
      super.data,});

  GetStudentCourseDetailsResponseModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? StudentCourseDetailsModel.fromJson(json['data']) : null;
  }

}

class StudentCourseDetailsModel  extends StudentCourseDetailsEntity{
  StudentCourseDetailsModel({
      super.name,
      super.totalDays,
      super.attendance,});

  StudentCourseDetailsModel.fromJson(dynamic json) {
    name = json['name'];
    totalDays = json['totalDays'];
    attendance = json['attendance'];
  }


}