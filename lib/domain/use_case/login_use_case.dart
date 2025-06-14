import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/dio_error.dart';
import 'package:graduation_project/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/login_response_entity.dart';
@injectable
class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<Either<DioFailure, LoginResponseEntity>> call(
    String email,
    String password,
  ) async {
    return await _loginRepository.login(email, password);

  }

}
