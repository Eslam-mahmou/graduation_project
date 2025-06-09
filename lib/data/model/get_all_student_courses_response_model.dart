import 'package:graduation_project/domain/entity/get_all_student_courses_response_entity.dart';

class GetAllStudentCoursesResponseModel extends GetAllCoursesStudentResponseEntity {
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

class GetStudentDataModel extends GetStudentDataEntity {
  GetStudentDataModel({
      super.count,
      super.allCourse,});

  GetStudentDataModel.fromJson(dynamic json) {
    count = json['count'];
    allCourse = json['allCourseDtos'] != null ? StudentCoursesModel.fromJson(json['allCourseDtos']) : null;
  }

}

class StudentCoursesModel extends StudentCoursesEntity{
  StudentCoursesModel({
      super.values,});

  StudentCoursesModel.fromJson(dynamic json) {
    values = [];
    if (json['\$values'] != null) {

      json['\$values'].forEach((v) {
        values?.add(CoursesStudentListModel.fromJson(v));
      });
    }
  }

}

class CoursesStudentListModel extends CoursesStudentListEntity {
  CoursesStudentListModel({
    super.courseId,
    super.name,});

  CoursesStudentListModel.fromJson(dynamic json) {
    courseId = json['id'];
    name = json['name'];
  }
}