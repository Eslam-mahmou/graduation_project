import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/dio_error.dart';
import 'package:graduation_project/domain/entity/get_all_course_student_response_entity.dart';

abstract class AttendanceRepository {
  Future<Either<DioFailure,GetAllCourseStudentResponseEntity>> getAllCourseStudent(int id);
}