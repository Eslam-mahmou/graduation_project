import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:graduation_project/core/Errors/dio_error.dart';
import 'package:graduation_project/data/data_source/attendance_remote_data_source.dart';
import 'package:graduation_project/data/model/get_subject_details_for_instructor_model.dart';
import 'package:graduation_project/domain/entity/get_subject_details_for_instructor_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/attendance_repository.dart';

@Injectable(as: AttendanceRepository)
class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSource _dataSource;

  AttendanceRepositoryImpl(this._dataSource);

  @override
  Future<Either<DioFailure, GetSubjectDetailsForInstructorEntity>>
  getAllCourseStudent(int id) async {
    var response = await _dataSource.getCourseStudentAttendance(id);
    try {
      log("response ${response.data}");
      if (response.statusCode == 200) {
        var data = GetSubjectDetailsForInstructorModel.fromJson(response.data);
        log("data ${data.data?.studentWithAttendanceDtos}");
        return Right(data);
      } else {
        log("error ${response.statusMessage}");
        return Left(
          ServerFailure.badFromResponse(response.statusCode!, response.data),
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
