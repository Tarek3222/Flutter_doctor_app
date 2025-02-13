import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theme/app_colors.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation(
      {super.key,
      required this.hasUppercase,
      required this.hasSpecialCharacters,
      required this.hasLowerCase,
      required this.hasNumber,
      required this.hasMinLength});
  final bool hasUppercase;
  final bool hasSpecialCharacters;
  final bool hasLowerCase;
  final bool hasNumber;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidatorRow('At least 1 uppercase letter', hasUppercase),
        verticalSpace(2),
        buildValidatorRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidatorRow('At least 1 number', hasNumber),
        verticalSpace(2),
        buildValidatorRow('At least 1 special character', hasSpecialCharacters),
        verticalSpace(2),
        buildValidatorRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidatorRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.grey,
        ),
        horizontalSpace(5),
        Text(
          text,
          style: AppStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColors.grey : AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}
