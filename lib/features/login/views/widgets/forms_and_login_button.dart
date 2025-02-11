import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:doctor/core/widgets/app_elevated_button.dart';
import 'package:doctor/features/login/views/widgets/email_field.dart';
import 'package:doctor/features/login/views/widgets/password_field.dart';
import 'package:flutter/material.dart';

class FormsAndLoginButton extends StatefulWidget {
  const FormsAndLoginButton({super.key});

  @override
  State<FormsAndLoginButton> createState() => _FormsAndLoginButtonState();
}

class _FormsAndLoginButtonState extends State<FormsAndLoginButton> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailField(),
          verticalSpace(18),
          PasswordField(),
          verticalSpace(24),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              'Forgot Password?',
              style: AppStyles.font13BlueRegular,
            ),
          ),
          verticalSpace(40),
          AppElevatedButton(
            onPressed: () {},
            text: 'Login',
          ),
        ],
      ),
    );
  }
}
