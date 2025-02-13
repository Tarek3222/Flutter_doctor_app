import 'package:doctor/core/helpers/app_regex.dart';
import 'package:doctor/core/widgets/app_text_form_field.dart';
import 'package:doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      controller: context.read<LoginCubit>().emailController,
      validator: (value) {
        if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}
