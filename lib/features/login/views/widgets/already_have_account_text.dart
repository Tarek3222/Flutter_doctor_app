import 'package:doctor/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account yet? ',
            style: AppStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Sign Up',
            style: AppStyles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
