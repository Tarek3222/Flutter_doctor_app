import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/features/home/views/widgets/doctors_blue_container.dart';
import 'package:doctor/features/home/views/widgets/doctors_speciality_list_view.dart';
import 'package:doctor/features/home/views/widgets/doctors_speciality_see_all.dart';
import 'package:doctor/features/home/views/widgets/home_top_bar.dart';
import 'package:doctor/features/home/views/widgets/doctor_list_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(16),
              const DoctorsSpecialityListView(),
              verticalSpace(8),
              const DoctorListView()
            ],
          ),
        ),
      ),
    );
  }
}
