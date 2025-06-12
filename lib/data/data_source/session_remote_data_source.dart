import 'package:dio/dio.dart';
import 'package:graduation_project/core/Services/api_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../core/Services/shared_preference_services.dart';
import '../../core/Utils/constant_manager.dart';
import '../../core/Utils/end_point.dart';

abstract class SessionRemoteDataSource {
  Future<Response> startSession(String courseId);
}
@Injectable(as: SessionRemoteDataSource)
class SessionRemoteDataSourceImpl implements SessionRemoteDataSource {
  final ApiManager _apiManager;

  SessionRemoteDataSourceImpl(this._apiManager);

  var token = SharedPreferenceServices.getToken(AppConstants.token).toString();
  @override
  Future<Response> startSession(String courseId) {
    final now = DateTime.now();
    final oneHourLater = now.add(Duration(hours: 1));

    final String date = DateFormat('yyyy-MM-dd').format(now);
    final String startTime = DateFormat('hh:mm a').format(now);
    final String endTime = DateFormat('hh:mm a').format(oneHourLater);
    return _apiManager.postData("${EndPoints.startSession}/$courseId",
        headers: {"Authorization": "Bearer $token"},
        body: {
          "date": "2025-06-12",
          "startTime": "04:15",
          "endTime": "04:35",
          "academicYearId": 2
        }
    );
  }

}

