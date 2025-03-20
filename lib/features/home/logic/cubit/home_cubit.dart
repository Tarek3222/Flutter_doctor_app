import 'package:doctor/features/home/data/repos/home_repo.dart';
import 'package:doctor/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const InitialState());

  Future<void> getSpecialities() async {
    emit(const LoadingState());
    final response = await _homeRepo.getSpecialities();
    response.fold(
      (error) => emit(
        ErrorState(
            errorMessage: error.apiErrorModel.message ?? 'An error occurred'),
      ),
      (specializationResponseModel) => emit(
        SuccessState(
          specializationResponseModel: specializationResponseModel,
        ),
      ),
    );
  }
}
