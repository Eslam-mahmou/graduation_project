import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/dio_error.dart';
import 'package:graduation_project/domain/entity/get_subject_details_for_instructor_entity.dart';

import '../entity/start_session_response_entity.dart';

abstract class AttendanceRepository {
  Future<Either<DioFailure, GetSubjectDetailsForInstructorEntity>>
  getAllCourseStudent(int id);
}
