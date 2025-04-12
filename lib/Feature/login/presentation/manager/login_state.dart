sealed class LoginState{

}
class LoginLoadingState extends LoginState{}
class LoginErrorState extends LoginState{
  final String errMessage;
  LoginErrorState(this.errMessage);
}
class LoginSuccessState extends LoginState{}