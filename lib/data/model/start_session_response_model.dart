import '../../domain/entity/start_session_response_entity.dart';

class StartSessionResponseModel extends StartSessionResponseEntity {
  StartSessionResponseModel({
      super.id,
      super.instructorId,
      super.courseId,
      super.date,
      super.startTime,
      super.endTime,
      super.academicYearId,
      super.academicYear,
      super.sessionDetails,});

  StartSessionResponseModel.fromJson(dynamic json) {
    id = json['id'];
    instructorId = json['instructorId'];
    courseId = json['courseId'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    academicYearId = json['academicYearId'];
    academicYear = json['academicYear'];
    sessionDetails = json['sessionDetails'];
  }

}
