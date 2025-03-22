import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theme/app_colors.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:doctor/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListViewItem extends StatelessWidget {
  const SpecialityListViewItem(
      {super.key,
      this.specializationData,
      required this.itemIndex,
      required this.selectedIndex});
  final SpecializationsData? specializationData;
  final int itemIndex;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: itemIndex == 0 ? 0 : 24.w,
      ),
      child: Column(
        children: [
          selectedIndex == itemIndex
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.darkBlue,
                      width: 1.4,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.lightBlue,
                    child: Image.asset(
                      "assets/images/general_speciality.png",
                      height: 42.h,
                      width: 42.w,
                    ),
                  ),
                )
              : CircleAvatar(
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
            style: itemIndex == selectedIndex
                ? AppStyles.font14DarkBlueBold
                : AppStyles.font12DarkBlueRegular,
          )
        ],
      ),
    );
  }
}
