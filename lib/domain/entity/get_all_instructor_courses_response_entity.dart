class GetAllInstructorCoursesResponseEntity {
  GetAllInstructorCoursesResponseEntity({
    this.statusCode,
    this.message,
    this.data,
  });

  num? statusCode;
  String? message;
  GetInstructorDataEntity? data;
}

class GetInstructorDataEntity {
  GetInstructorDataEntity({this.count, this.allInstructorCourses});

  num? count;
  InstructorCoursesEntity? allInstructorCourses;
}

class InstructorCoursesEntity {
  InstructorCoursesEntity({this.values});

  List<InstructorCoursesListEntity>? values;
}

class InstructorCoursesListEntity {
  InstructorCoursesListEntity({this.id, this.name});

  num? id;
  String? name;
}
