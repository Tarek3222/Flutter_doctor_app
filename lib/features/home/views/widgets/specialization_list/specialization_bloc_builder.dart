import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor/features/home/logic/cubit/home_state.dart';
import 'package:doctor/features/home/views/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:doctor/features/home/views/widgets/specialization_list/speciality_list_view.dart';
import 'package:doctor/features/home/views/widgets/specialization_list/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is LoadingState ||
          current is ErrorState ||
          current is SuccessState,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            return setupLoading();
          case ErrorState():
            return setupError();
          case SuccessState():
            var specializationsList = state.specializationDataList;
            return setupSuccess(specializationsList);
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget setupSuccess(specializationsList) {
    return SpecialityListView(
      specializationDataList: specializationsList ?? [],
    );
  }

  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
