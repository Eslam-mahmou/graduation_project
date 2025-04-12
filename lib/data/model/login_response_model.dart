import 'package:graduation_project/domain/entity/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({ super.message, super.data});

  LoginResponseModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? LoginDataModel.fromJson(json['data']) : null;
  }
}

class LoginDataModel extends LoginDataEntity {
  LoginDataModel({super.id, super.email, super.token});

  LoginDataModel.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    token = json['token'];
  }
}
