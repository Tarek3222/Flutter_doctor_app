import 'package:doctor/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Email',
    );
  }
}
