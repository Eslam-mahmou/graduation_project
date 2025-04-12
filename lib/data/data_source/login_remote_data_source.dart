import 'package:dio/dio.dart';
import 'package:graduation_project/core/Services/api_manager.dart';
import 'package:graduation_project/core/Utils/end_point.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDataSource {
  Future<Response> login(String email, String password);
}
@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiManager _apiManager;

  LoginRemoteDataSourceImpl(this._apiManager);

  @override
  Future<Response> login(String email, String password) async {
    return await _apiManager.postData(
      EndPoints.login,
      body: {'email': email, 'password': password},
    );
  }
}
