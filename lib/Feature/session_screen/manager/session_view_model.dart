import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Feature/session_screen/manager/session_state.dart';
import 'package:graduation_project/domain/use_case/session_use_case.dart';
import 'package:injectable/injectable.dart';
@injectable
class SessionViewModel extends Cubit<SessionState> {
  SessionViewModel(this._sessionUseCase)
    : super(StartSessionLoadingState());
  final SessionUseCase _sessionUseCase;

  void startSession(String courseId) async {
    emit(StartSessionLoadingState());
    var result = await _sessionUseCase.execute(courseId);
    result.fold((error) => emit(StartSessionErrorState(error.errorMessage)), (
      response,
    ) {
      log("id ${response.id}");
      emit(StartSessionSuccessState());
    });
  }
}
