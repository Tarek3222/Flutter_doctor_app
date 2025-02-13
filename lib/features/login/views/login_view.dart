import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:doctor/core/widgets/app_elevated_button.dart';
import 'package:doctor/features/login/data/models/login_request_body.dart';
import 'package:doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor/features/login/views/widgets/dont_have_an_account_text.dart';
import 'package:doctor/features/login/views/widgets/email_and_password_fields.dart';
import 'package:doctor/features/login/views/widgets/login_bloc_listener.dart';
import 'package:doctor/features/login/views/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: AppStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: AppStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                const EmailAndPasswordFields(),
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
                  onPressed: () {
                    validateThenLogin(context);
                  },
                  text: 'Login',
                ),
                verticalSpace(16),
                const TermsAndConditionsText(),
                verticalSpace(60),
                const Align(
                  alignment: Alignment.center,
                  child: DontHaveAnAccountText(),
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
            loginRequestBody: LoginRequestBody(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    } else {
      context.read<LoginCubit>().autoValidate = AutovalidateMode.always;
    }
  }
}
