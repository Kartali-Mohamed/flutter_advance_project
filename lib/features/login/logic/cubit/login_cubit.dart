import 'package:flutter/material.dart';
import 'package:flutter_advance_project/features/login/data/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/login_request_body.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginStates() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) {
      emit(LoginState.loginSuccess(loginResponse));
    }, failure: (apiErrorModel) {
      emit(LoginState.loginError(apiErrorModel));
    });
  }
}
