import 'package:dio/dio.dart';
import 'package:graduation_project/core/Services/shared_preference_services.dart';
import 'package:graduation_project/core/Utils/constant_manager.dart';
import 'package:injectable/injectable.dart';

import '../../core/Services/api_manager.dart';
import '../../core/Utils/end_point.dart';

abstract class UserRemoteDataSource {
  Future<Response> getAllStudentCourses();

  Future<Response> getAllInstructorCourses();

  Future<Response> getStudentCourseDetails(int id);

  Future<Response> getUserInfo();
}

@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiManager _apiManager;
  UserRemoteDataSourceImpl(this._apiManager);
  var token = SharedPreferenceServices.getToken(AppConstants.token).toString();
  @override
  Future<Response> getAllStudentCourses() async {
    return await _apiManager.getData(
      EndPoints.studentCourses, headers: {"Authorization": "Bearer $token"},
    );
  }
  @override
  Future<Response> getAllInstructorCourses() async {
    return await _apiManager.getData(
      EndPoints.instructorCourses,
      headers: {"Authorization": "Bearer $token"},
    );
  }
  @override
  Future<Response> getStudentCourseDetails(int id) async {
    return await _apiManager.getData(
      EndPoints.studentCourseDetails,
      queryParameters: {"courseId": id},
      headers: {"Authorization": "Bearer $token"},
    );
  }
  @override
  Future<Response> getUserInfo() async {
    return await _apiManager.getData(
      EndPoints.userInfo, headers: {"Authorization": "Bearer $token"},
    );
  }
}
