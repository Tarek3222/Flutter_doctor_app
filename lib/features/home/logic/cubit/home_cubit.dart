import 'package:doctor/core/helpers/extensions.dart';
import 'package:doctor/features/home/data/models/specialization_response_model.dart';
import 'package:doctor/features/home/data/repos/home_repo.dart';
import 'package:doctor/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const InitialState());

  List<SpecializationsData?>? specializationDataList = [];

  Future<void> getSpecialities() async {
    emit(const LoadingState());
    final response = await _homeRepo.getSpecialities();
    response.fold(
        (error) => emit(
              ErrorState(
                  errorMessage:
                      error.apiErrorModel.message ?? 'An error occurred'),
            ), (specializationResponseModel) {
      specializationDataList =
          specializationResponseModel.specializationDataList;
      // get the first specialization data list by default
      getDoctorsList(specializationId: specializationDataList?.first?.id);
      emit(
        SuccessState(
          specializationDataList: specializationDataList,
        ),
      );
    });
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList =
        getDoctorsListBySpecializationId(specializationId);

    if (doctorsList.isNullOrEmpty()) {
      emit(const DoctorsErrorState(errorMessage: 'No doctors found'));
    } else {
      emit(DoctorsSuccessState(doctorsList: doctorsList));
    }
  }

  /// returns the list of doctors based on the specialization id
  List<Doctors?>? getDoctorsListBySpecializationId(int? specializationId) {
    return specializationDataList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
