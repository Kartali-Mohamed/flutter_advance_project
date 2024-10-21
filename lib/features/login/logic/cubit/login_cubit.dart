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

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(success: (loginResponse) {
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}