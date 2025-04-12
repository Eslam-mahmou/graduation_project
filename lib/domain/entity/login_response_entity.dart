class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.data,});
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