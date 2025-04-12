import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/dio_error.dart';
import 'package:graduation_project/domain/entity/get_all_instructor_courses_response_entity.dart';
import 'package:graduation_project/domain/entity/get_student_course_details_response_entity.dart';
import 'package:graduation_project/domain/entity/get_user_info_response_entity.dart';

import '../entity/get_all_student_courses_response_entity.dart';

abstract class UserRepository {
  Future<Either<DioFailure,GetAllStudentCoursesResponseEntity>> getAllStudentCourses();
  Future<Either<DioFailure,GetAllInstructorCoursesResponseEntity>> getAllInstructorCourses();
  Future<Either<DioFailure,GetStudentCourseDetailsResponseEntity>> getStudentCourseDetails(int id);
  Future<Either<DioFailure ,GetUserInfoResponseEntity>> getUserInfo();
}