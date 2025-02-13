import 'package:doctor/core/helpers/app_regex.dart';
import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor/features/login/views/widgets/email_field.dart';
import 'package:doctor/features/login/views/widgets/password_field.dart';
import 'package:doctor/features/login/views/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPasswordFields extends StatefulWidget {
  const EmailAndPasswordFields({super.key});

  @override
  State<EmailAndPasswordFields> createState() => _EmailAndPasswordFieldsState();
}

class _EmailAndPasswordFieldsState extends State<EmailAndPasswordFields> {
  late TextEditingController passwordController;

  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasLowerCase = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(
      () {
        setState(
          () {
            hasUppercase = AppRegex.hasUpperCase(passwordController.text);
            hasSpecialCharacters =
                AppRegex.hasSpecialCharacter(passwordController.text);
            hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
            hasNumber = AppRegex.hasNumber(passwordController.text);
            hasMinLength = AppRegex.hasMinLength(passwordController.text);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      autovalidateMode: context.read<LoginCubit>().autoValidate,
      child: Column(
        children: [
          const EmailField(),
          verticalSpace(18),
          const PasswordField(),
          verticalSpace(24),
          PasswordValidation(
            hasUppercase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasLowerCase: hasLowerCase,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
