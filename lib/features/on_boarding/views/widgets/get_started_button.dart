import 'package:doctor/core/helpers/extensions.dart';
import 'package:doctor/core/routing/routes.dart';
import 'package:doctor/core/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      text: 'Get Started',
    );
  }
}
