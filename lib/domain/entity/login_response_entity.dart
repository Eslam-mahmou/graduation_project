class LoginResponseEntity {
  LoginResponseEntity({
      this.statusCode, 
      this.message, 
      this.data,});
  num? statusCode;
  String? message;
  LoginDataEntity? data;


}

class LoginDataEntity {
  LoginDataEntity({
      this.id, 
      this.email, 
      this.token,});
  num? id;
  String? email;
  String? token;
}