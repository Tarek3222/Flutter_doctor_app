import 'package:doctor/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor/features/home/logic/cubit/home_state.dart';
import 'package:doctor/features/home/views/widgets/doctors_list/doctor_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccessState || current is DoctorsErrorState,
      builder: (context, state) {
        switch (state) {
          case DoctorsSuccessState():
            return setupSuccess(state);
          case DoctorsErrorState():
            return setupError();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget setupSuccess(DoctorsSuccessState state) =>
      DoctorListView(doctorsList: state.doctorsList ?? []);

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
