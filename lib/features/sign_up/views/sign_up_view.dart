import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:doctor/core/widgets/app_elevated_button.dart';
import 'package:doctor/features/login/views/widgets/terms_and_conditions_text.dart';
import 'package:doctor/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:doctor/features/sign_up/views/widgets/already_have_an_account_text.dart';
import 'package:doctor/features/sign_up/views/widgets/sign_up_bloc_listener.dart';
import 'package:doctor/features/sign_up/views/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                  'Create Account',
                  style: AppStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: AppStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const SignupForm(),
                    verticalSpace(40),
                    AppElevatedButton(
                      text: "Create Account",
                      textStyle: AppStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
                    const AlreadyHaveAnAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    } else {
      context.read<SignupCubit>().autoValidate = AutovalidateMode.always;
    }
  }
}
