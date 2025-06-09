import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/repository/session_repository.dart';

import '../../core/Errors/dio_error.dart';
import '../entity/start_session_response_entity.dart';

class SessionUseCase {
final SessionRepository _startSessionRepository;

 SessionUseCase(this._startSessionRepository);

  Future<Either<DioFailure, StartSessionResponseEntity>> execute(String courseId) {
    return _startSessionRepository.startSession(courseId);
  }
}