import 'package:graduation_project/domain/entity/get_subject_details_for_instructor_entity.dart';

class GetSubjectDetailsForInstructorModel
    extends GetSubjectDetailsForInstructorEntity {
  GetSubjectDetailsForInstructorModel({
    super.statusCode,
    super.message,
    super.data,
  });

  GetSubjectDetailsForInstructorModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data =
        json['data'] != null
            ? GetDataSubjectDetailsInstructorModel.fromJson(json['data'])
            : null;
  }
}

class GetDataSubjectDetailsInstructorModel
    extends GetDataSubjectDetailsInstructorEntity {
  GetDataSubjectDetailsInstructorModel({
    super.name,
    super.totalLectures,
    super.regiseteredStudentCount,
    super.studentWithAttendanceDtos,
  });

  GetDataSubjectDetailsInstructorModel.fromJson(dynamic json) {
    name = json['name'];
    totalLectures = json['totalLectures'];
    regiseteredStudentCount = json['regiseteredStudentCount'];
    studentWithAttendanceDtos =
        json['studentWithAttendanceDtos'] != null
            ? StudentWithAttendanceModel.fromJson(
              json['studentWithAttendanceDtos'],
            )
            : null;
  }
}

class StudentWithAttendanceModel extends StudentWithAttendanceEntity {
  StudentWithAttendanceModel({super.values});

  StudentWithAttendanceModel.fromJson(dynamic json) {
    values = [];
    if (json['\$values'] != null) {
      json['\$values'].forEach((v) {
        values?.add(StudentWithAttendanceListModel.fromJson(v));
      });
    }
  }
}

class StudentWithAttendanceListModel extends StudentWithAttendanceListEntity {
  StudentWithAttendanceListModel({
    super.id,
    super.name,
    super.attendance,
    super.code,
  });

  StudentWithAttendanceListModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    attendance = json['attendance'];
    code = json['code'];
  }
}
