import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor/features/home/logic/cubit/home_state.dart';
import 'package:doctor/features/home/views/widgets/doctor_list_view.dart';
import 'package:doctor/features/home/views/widgets/doctors_speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationAndDoctorBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            return setupLoading();
          case ErrorState():
            return setupError();
          case SuccessState():
            var specializationsList =
                state.specializationResponseModel.specializationDataList;
            return setupSuccess(specializationsList);
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget setupSuccess(specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationDataList: specializationsList ?? [],
          ),
          verticalSpace(8),
          DoctorListView(
            doctorsList: specializationsList?[0]?.doctorsList,
          ),
        ],
      ),
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
