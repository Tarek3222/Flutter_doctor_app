import 'package:doctor/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

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
