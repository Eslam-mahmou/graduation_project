import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/entity/get_all_instructor_courses_response_entity.dart';
import 'package:graduation_project/domain/entity/get_student_course_details_response_entity.dart';
import 'package:graduation_project/domain/entity/get_user_info_response_entity.dart';
import 'package:graduation_project/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/Errors/dio_error.dart';
import '../entity/get_all_student_courses_response_entity.dart';
@injectable
class UserUseCase {
  final UserRepository _repository;

  UserUseCase(this._repository);

  Future<Either<DioFailure, GetAllStudentCoursesResponseEntity>>
  executeStudent() {
    return _repository.getAllStudentCourses();
  }

  Future<Either<DioFailure,
      GetAllInstructorCoursesResponseEntity>> executeInstructor() {
    return _repository.getAllInstructorCourses();
  }

  Future<Either<DioFailure,
      GetStudentCourseDetailsResponseEntity>> invokeCourseDetails(int id) {
    return _repository.getStudentCourseDetails(id);
  }
  Future<Either<DioFailure,GetUserInfoResponseEntity>> invokeUserInfo() {
    return _repository.getUserInfo();
  }
}