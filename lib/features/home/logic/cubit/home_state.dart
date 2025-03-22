//home_state.dart
import 'package:doctor/features/home/data/models/specialization_response_model.dart';

sealed class HomeState {
  const HomeState();
}

// Specialization State
class InitialState extends HomeState {
  const InitialState();
}

class LoadingState extends HomeState {
  const LoadingState();
}

class ErrorState extends HomeState {
  final String errorMessage;
  const ErrorState({required this.errorMessage});
}

class SuccessState extends HomeState {
  final List<SpecializationsData?>? specializationDataList;
  const SuccessState({required this.specializationDataList});
}

// Doctors State
class DoctorsSuccessState extends HomeState {
  final List<Doctors?>? doctorsList;
  const DoctorsSuccessState({required this.doctorsList});
}

class DoctorsErrorState extends HomeState {
  final String errorMessage;
  const DoctorsErrorState({required this.errorMessage});
}
