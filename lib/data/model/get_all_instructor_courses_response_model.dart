import 'package:graduation_project/domain/entity/get_all_instructor_courses_response_entity.dart';
import 'package:graduation_project/domain/entity/get_all_student_courses_response_entity.dart';

class GetAllInstructorCoursesResponseModel
    extends GetAllInstructorCoursesResponseEntity {
  GetAllInstructorCoursesResponseModel({
    super.statusCode,
    super.message,
    super.data,
  });

  GetAllInstructorCoursesResponseModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data =
        json['data'] != null
            ? GetInstructorDataModel.fromJson(json['data'])
            : null;
  }
}

class GetInstructorDataModel extends GetInstructorDataEntity {
  GetInstructorDataModel({super.count, super.allInstructorCourses});

  GetInstructorDataModel.fromJson(dynamic json) {
    count = json['count'];
    allInstructorCourses = (json['allCourseDtos'] != null ? InstructorCoursesModel.fromJson(json['allCourseDtos']) : null) ;
  }
}

class InstructorCoursesModel extends InstructorCoursesEntity {
  InstructorCoursesModel({super.values});

  InstructorCoursesModel.fromJson(dynamic json) {
    values = [];
    if (json['\$values'] != null) {
      json['\$values'].forEach((v) {
        values?.add(InstructorCoursesListModel.fromJson(v));
      });
    }
  }
}

class InstructorCoursesListModel extends InstructorCoursesListEntity {
  InstructorCoursesListModel({super.id, super.name});

  InstructorCoursesListModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}
