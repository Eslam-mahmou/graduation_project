import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/entity/get_subject_details_for_instructor_entity.dart';
import 'package:graduation_project/domain/use_case/attendance_use_cae.dart';
import 'package:injectable/injectable.dart';

import 'attendance_state.dart';

@injectable
class AttendanceViewModel extends Cubit<AttendanceState> {
  AttendanceViewModel(this._attendanceUseCase)
    : super(AttendanceLoadingState());
  final AttendanceUseCase _attendanceUseCase;
  List<StudentWithAttendanceListEntity> attendance = [];
  Future<void> getAllCourseStudent(int id) async {
    emit(AttendanceLoadingState());
    final result = await _attendanceUseCase.execute(id);

    result.fold(
      (error) {
        emit(AttendanceErrorState(error.errorMessage));
      },
      (response) {
        attendance = response.data!.studentWithAttendanceDtos?.values ?? [];
        log("eqwfiWE TW B  ${attendance.toString()}");
        emit(AttendanceSuccessState(response.data!));
      },
    );
  }
}
