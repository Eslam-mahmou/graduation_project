import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:graduation_project/core/Errors/dio_error.dart';
import 'package:graduation_project/core/Services/shared_preference_services.dart';
import 'package:graduation_project/core/Utils/constant_manager.dart';
import 'package:graduation_project/data/data_source/login_remote_data_source.dart';

import 'package:graduation_project/domain/entity/login_response_entity.dart';

import '../../domain/repository/login_repository.dart';
import '../model/login_response_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepositoryImpl(this._loginRemoteDataSource);

  @override
  Future<Either<DioFailure, LoginResponseEntity>> login(
    String email,
    String password,
  ) async {
    final response = await _loginRemoteDataSource.login(email, password);
    try {
      log("response ${response.data}");
      if (response.statusCode == 200) {
        var data = LoginResponseModel.fromJson(response.data);
        SharedPreferenceServices.saveToken(
          AppConstants.token,
          data.data!.token.toString(),
        );
        log("token ${data.data!.token.toString()}");
        return Right(data);
      } else {
        return Left(
          ServerFailure.BadfromResponse(response.statusCode!, response.data),
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
