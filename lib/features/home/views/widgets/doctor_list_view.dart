import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                    width: 110.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr.Tarek Ali",
                        style: AppStyles.font18DarkBlueBold,
                      ),
                      verticalSpace(5),
                      Text(
                        "General | RSUD Gatot Subroto",
                        style: AppStyles.font12GreyMedium,
                      ),
                      verticalSpace(5),
                      Text(
                        "tarekali@rsudgatotsubroto",
                        style: AppStyles.font12GreyMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
