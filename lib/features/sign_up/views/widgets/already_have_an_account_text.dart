import 'package:doctor/core/helpers/extensions.dart';
import 'package:doctor/core/routing/routes.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: AppStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Login',
            style: AppStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}
