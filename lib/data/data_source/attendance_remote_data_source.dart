import 'package:dio/dio.dart';
import 'package:graduation_project/core/Services/api_manager.dart';
import 'package:injectable/injectable.dart';

import '../../core/Services/shared_preference_services.dart';
import '../../core/Utils/constant_manager.dart';
import '../../core/Utils/end_point.dart';

abstract class AttendanceRemoteDataSource {
  Future<Response> getCourseStudentAttendance(int id);
}
@Injectable(as: AttendanceRemoteDataSource)
class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final ApiManager _apiManager;

  AttendanceRemoteDataSourceImpl(this._apiManager);

  var token = SharedPreferenceServices.getToken(AppConstants.token).toString();

  @override
  Future<Response> getCourseStudentAttendance(int id) {
    return _apiManager.getData(
      EndPoints.instructorCourseDetails,
      queryParameters: {"courseId": id},
      headers: {"Authorization": "Bearer $token"},
    );
  }
}
