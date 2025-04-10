
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/dio_error.dart';

import '../entity/login_response_entity.dart';

abstract class LoginRepository {
  Future<Either<DioFailure, LoginResponseEntity>> login(String email, String password);
}