import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/entity/get_all_course_student_response_entity.dart';
import 'package:graduation_project/domain/repository/attendance_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/Errors/dio_error.dart';
@injectable
class AttendanceUseCase {
  final AttendanceRepository _repository;

  AttendanceUseCase(this._repository);

  Future<Either<DioFailure, GetAllCourseStudentResponseEntity>> execute(
    int id,
  ) async {
    return await _repository.getAllCourseStudent(id);
  }
}
