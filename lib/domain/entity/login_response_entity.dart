class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.data,
    this.statusCode});

  String? message;
  LoginDataEntity? data;
  num? statusCode;


}

class LoginDataEntity {
  LoginDataEntity({
    this.id,
    this.email,
    this.token,
    this.code
  });

  num? id;
  String? email;
  String? code;
  String? token;
}