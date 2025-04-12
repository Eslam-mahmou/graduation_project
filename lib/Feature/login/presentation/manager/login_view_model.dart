import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/use_case/login_use_case.dart';
import 'package:injectable/injectable.dart';

import 'login_state.dart';
@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel(this._loginUseCase) : super(LoginLoadingState());
 final LoginUseCase _loginUseCase;
var emailController = TextEditingController();
var passwordController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(LoginLoadingState());
    var result = await _loginUseCase.call(
      emailController.text,passwordController.text
    );
   result.fold((error) {
     emit(LoginErrorState(error.errorMessage));
   }, (response) {
     emit(LoginSuccessState());
   },);
  }

}