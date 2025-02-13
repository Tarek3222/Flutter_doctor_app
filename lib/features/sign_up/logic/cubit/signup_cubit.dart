import 'package:doctor/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:doctor/features/sign_up/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpRepo signUpRepo;
  SignupCubit(this.signUpRepo) : super(const SignupState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  Future<void> emitSignupStates() async {
    emit(const SignupState.loading());
    var response = await signUpRepo.signup(
      signUpRequestBody: SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.fold(
      (failure) {
        emit(
          SignupState.error(errorMessage: failure.apiErrorModel.message ?? ''),
        );
      },
      (signUpResponse) {
        emit(
          SignupState.success(signUpResponse),
        );
      },
    );
  }
}
