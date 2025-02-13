import 'package:doctor/core/helpers/app_regex.dart';
import 'package:doctor/core/widgets/app_text_form_field.dart';
import 'package:doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
  });
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Password',
      isObscureText: isObscureText,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            !AppRegex.isPasswordValid(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      controller: context.read<LoginCubit>().passwordController,
      suffixIcon: IconButton(
        icon: Icon(
          isObscureText ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: () {
          setState(
            () {
              isObscureText = !isObscureText;
            },
          );
        },
      ),
    );
  }
}
