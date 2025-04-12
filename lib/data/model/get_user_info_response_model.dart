import 'package:graduation_project/domain/entity/get_user_info_response_entity.dart';

class GetUserInfoResponseModel extends GetUserInfoResponseEntity{
  GetUserInfoResponseModel({
      super.statusCode,
      super.message,
      super.data,});

  GetUserInfoResponseModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? UserDataInfoModel.fromJson(json['data']) : null;
  }

}

class UserDataInfoModel extends UserDataInfoEntity {
  UserDataInfoModel({
      super.id,
      super.name,
      super.email,});

  UserDataInfoModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }


}