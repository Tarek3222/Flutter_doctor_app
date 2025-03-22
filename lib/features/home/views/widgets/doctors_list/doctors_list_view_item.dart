import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theme/app_colors.dart';
import 'package:doctor/core/theme/app_styles.dart';
import 'package:doctor/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key, required this.doctorModel});
  final Doctors doctorModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050",
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Shimmer.fromColors(
                baseColor: AppColors.lightGrey,
                highlightColor: Colors.white,
                child: Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) => Container(
              width: 110.w,
              height: 120.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
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
