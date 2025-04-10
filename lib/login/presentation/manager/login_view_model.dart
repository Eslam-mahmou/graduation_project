import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/use_case/login_use_case.dart';
import 'package:graduation_project/login/presentation/manager/login_state.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel(this._loginUseCase) : super(LoginLoadingState());
 final LoginUseCase _loginUseCase;

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    var result = await _loginUseCase.call(email, password);
   result.fold((error) {
     emit(LoginErrorState(error.errorMessage));
   }, (response) {
     emit(LoginSuccessState());
   },);
  }

}