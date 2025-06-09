import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/entity/start_session_response_entity.dart';

import '../../core/Errors/dio_error.dart';

abstract class SessionRepository {
  Future<Either<DioFailure, StartSessionResponseEntity>> startSession(
String courseId
      );
}