import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:graduation_project/core/Errors/dio_error.dart';
import 'package:graduation_project/domain/entity/start_session_response_entity.dart';

import '../../domain/repository/session_repository.dart';
import '../data_source/session_remote_data_source.dart';
import '../model/start_session_response_model.dart';

class SessionRepositoryImpl implements SessionRepository {
  final SessionRemoteDataSource _dataSource;

  SessionRepositoryImpl(this._dataSource);

  @override
  Future<Either<DioFailure, StartSessionResponseEntity>> startSession(
      String courseId) async {
    var response = await _dataSource.startSession(courseId);
    try {
      if (response.statusCode == 200) {
        var data = StartSessionResponseModel.fromJson(response.data);
        return Right(data);
      } else {
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
