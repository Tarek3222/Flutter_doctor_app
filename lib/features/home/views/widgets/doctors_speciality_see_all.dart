import 'package:doctor/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctor Speciality',
          style: AppStyles.font18DarkBlueSemiBold,
        ),
        const Spacer(),
        Text(
          'See All',
          style: AppStyles.font13BlueRegular,
        ),
      ],
    );
  }
}
