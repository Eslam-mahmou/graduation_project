import 'package:graduation_project/domain/entity/get_all_instructor_courses_response_entity.dart';
import 'package:graduation_project/domain/entity/get_all_student_courses_response_entity.dart';

class GetAllInstructorCoursesResponseModel extends GetAllInstructorCoursesResponseEntity {
  GetAllInstructorCoursesResponseModel({
      super.statusCode,
      super.message,
      super.data,});

  GetAllInstructorCoursesResponseModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data extends GetInstructorDataEntity{
  Data({
      super.count,
      super.allInstructorCourses,});

  Data.fromJson(dynamic json) {
    count = json['count'];
    if (json['allCourseDtos'] != null) {
      allInstructorCourses = [];
      json['allCourseDtos'].forEach((v) {
        allInstructorCourses?.add(InstructorCoursesModel.fromJson(v));
      });
    }
  }

}

class InstructorCoursesModel extends InstructorCoursesEntity{
  InstructorCoursesModel({
      super.id,
      super.name,});

  InstructorCoursesModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

}