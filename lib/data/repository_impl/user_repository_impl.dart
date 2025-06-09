import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:graduation_project/core/Errors/dio_error.dart';
import 'package:graduation_project/data/data_source/user_remote_data_source.dart';
import 'package:graduation_project/data/model/get_all_instructor_courses_response_model.dart';
import 'package:graduation_project/data/model/get_student_course_details_response_model.dart';
import 'package:graduation_project/data/model/get_user_info_response_model.dart';

import 'package:graduation_project/domain/entity/get_all_instructor_courses_response_entity.dart';

import 'package:graduation_project/domain/entity/get_all_student_courses_response_entity.dart';
import 'package:graduation_project/domain/entity/get_student_course_details_response_entity.dart';
import 'package:graduation_project/domain/entity/get_user_info_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/user_repository.dart';
import '../model/get_all_student_courses_response_model.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _dataSource;
  UserRepositoryImpl(this._dataSource);
  @override
  Future<Either<DioFailure, GetAllInstructorCoursesResponseEntity>>
  getAllInstructorCourses() async {
    var response = await _dataSource.getAllInstructorCourses();
    try {
      log("response ${response.data}");
      if (response.data["statusCode"] == 200) {
        var data = GetAllInstructorCoursesResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        log("error ${response.data["message"]}");
        return Left(
          ServerFailure.badFromResponse(
            response.data["statusCode"]!,
            response.data,
          ),
        );
      }
    } catch (e, s) {
      log(s.toString());
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return Left(NetworkFailure(e.errorMessage));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<DioFailure, GetAllCoursesStudentResponseEntity>>
  getAllStudentCourses() async {
    var response = await _dataSource.getAllStudentCourses();
    try {
      log("response ${response.data}");
      if (response.statusCode == 200) {
        var data = GetAllStudentCoursesResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        log("error ${response.data["message"]}");
        return Left(
          ServerFailure.badFromResponse(
            response.data["statusCode"]!,
            response.data,
          ),
        );
      }
    } catch (e, s) {
      log(s.toString());
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return Left(NetworkFailure(e.errorMessage));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<DioFailure, GetStudentCourseDetailsResponseEntity>>
  getStudentCourseDetails(int id) async {
    var response = await _dataSource.getStudentCourseDetails(id);
    try {
      log("response ${response.data}");
      if (response.statusCode== 200) {
        var data = GetStudentCourseDetailsResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        log("error ${response.data["message"]}");
        return Left(
          ServerFailure.badFromResponse(
            response.statusCode!,
            response.data,
          ),
        );
      }
    } catch (e, s) {
      log(s.toString());
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return Left(NetworkFailure(e.errorMessage));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<DioFailure, GetUserInfoResponseEntity>> getUserInfo() async{
    var response = await _dataSource.getUserInfo();
    try {
      log("response ${response.data}");
      if (response.data["statusCode"] == 200) {
        var data = GetUserInfoResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        log("error ${response.data["message"]}");
        return Left(
          ServerFailure.badFromResponse(
            response.data["statusCode"]!,
            response.data,
          ),
        );
      }
    } catch (e, s) {
      log(s.toString());
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return Left(NetworkFailure(e.errorMessage));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
