import 'package:doctor/features/home/data/models/specialization_response_model.dart';
import 'package:doctor/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor/features/home/views/widgets/specialization_list/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({super.key, required this.specializationDataList});
  final List<SpecializationsData?> specializationDataList;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  int specialitySelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (specialitySelectedIndex != index) {
                setState(() {
                  specialitySelectedIndex = index;
                });
                context.read<HomeCubit>().getDoctorsList(
                    specializationId: widget.specializationDataList[index]?.id);
              }
            },
            child: SpecialityListViewItem(
              specializationData: widget.specializationDataList[index],
              itemIndex: index,
              selectedIndex: specialitySelectedIndex,
            ),
          );
        },
        itemCount: widget.specializationDataList.length,
      ),
    );
  }
}
