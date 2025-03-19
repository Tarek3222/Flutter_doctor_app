import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theme/app_colors.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: index == 0 ? 0 : 24.w,
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
                  "cardiologist",
                  style: AppStyles.font12DarkBlueRegular,
                )
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
