import '../../domain/entity/start_session_response_entity.dart';

class StartSessionResponseModel extends StartSessionResponseEntity {
  StartSessionResponseModel({
      super.id,
      super.instructorId,
      super.courseId,
});

  StartSessionResponseModel.fromJson(dynamic json) {
    id = json['id'];
    instructorId = json['instructorId'];
    courseId = json['courseId'];

  }

}
