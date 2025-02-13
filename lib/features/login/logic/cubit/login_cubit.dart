import 'package:doctor/features/login/data/models/login_request_body.dart';
import 'package:doctor/features/login/data/repos/login_repo.dart';
import 'package:doctor/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  Future<void> emitLoginStates(
      {required LoginRequestBody loginRequestBody}) async {
    emit(const LoginState.loading());
    var response = await _loginRepo.login(loginRequestBody: loginRequestBody);
    response.fold(
      (failure) {
        emit(
          LoginState.error(errorMessage: failure.apiErrorModel.message ?? ''),
        );
      },
      (loginResponse) {
        emit(
          LoginState.success(loginResponse),
        );
      },
    );
  }
}
