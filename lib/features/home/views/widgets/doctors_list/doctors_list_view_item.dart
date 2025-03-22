import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:doctor/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key, required this.doctorModel});
  final Doctors doctorModel;

  @override
  Widget build(BuildContext context) {
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
                  doctorModel.name ?? "name",
                  style: AppStyles.font18DarkBlueBold,
                ),
                verticalSpace(5),
                Text(
                  "${doctorModel.degree} | ${doctorModel.phone ?? "phone"}",
                  style: AppStyles.font12GreyMedium,
                ),
                verticalSpace(5),
                Text(
                  doctorModel.email ?? "email",
                  style: AppStyles.font12GreyMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
