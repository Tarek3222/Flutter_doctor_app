import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:doctor/features/login/views/widgets/already_have_account_text.dart';
import 'package:doctor/features/login/views/widgets/forms_and_login_button.dart';
import 'package:doctor/features/login/views/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
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
                FormsAndLoginButton(),
                verticalSpace(16),
                TermsAndConditionsText(),
                verticalSpace(60),
                Align(
                  alignment: Alignment.center,
                  child: AlreadyHaveAccountText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
