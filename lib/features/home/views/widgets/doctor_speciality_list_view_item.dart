import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theme/app_colors.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:doctor/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  const DoctorSpecialityListViewItem(
      {super.key, this.specializationData, required this.itemIndex});
  final SpecializationsData? specializationData;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: itemIndex == 0 ? 0 : 24.w,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.lightBlue,
            child: Image.asset(
              "assets/images/general_speciality.png",
              height: 40.h,
              width: 40.w,
            ),
          ),
          verticalSpace(8),
          Text(
            specializationData?.name ?? "Speciality",
            style: AppStyles.font12DarkBlueRegular,
          )
        ],
      ),
    );
  }
}
