class GetUserInfoResponseEntity {
  GetUserInfoResponseEntity({
      this.statusCode, 
      this.message, 
      this.data,});
  num? statusCode;
  String? message;
  UserDataInfoEntity? data;


}

class UserDataInfoEntity {
  UserDataInfoEntity({
      this.id, 
      this.name, 
      this.email,});

  num? id;
  String? name;
  String? email;
}